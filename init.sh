#!/bin/env bash
# fmod studio
set -euo pipefail

DOTFILES=$PWD

# set zsh path
echo "Set ZDOTDIR to $HOME/.config/zsh"
echo "ZDOTDIR=$HOME/.config/zsh" | sudo tee zshenv >/dev/null
if ! [[ -d $XDG_CONFIG_HOME ]]; then
  echo "~/.config not found,creating one..."
  mkdir $HOME/.config
fi
if ! [[ -d $HOME/.local ]]; then
  echo "~/.local not found,creating one..."
  mkdir $HOME/.local
fi

# yay
init_yay() {
  mkdir $HOME/repos
  cd $HOME/repos
  git clone https://aur.archlinux.org/yay-bin.git
  cd  yay-bin
  echo "Building yay-bin"
  makepkg -si
  yay -Y --gendb
}

gen_ssh() {
  read -p "Email: " email
  if [[ -z $email ]]; then
    echo "Email required"
    gen_ssh
  fi
  if ! [[ $email =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]; then
    echo "Must be valid email address"
    gen_ssh
  fi
}

gen_gpg() {
  echo "Generate GPG"
  gpg --full-generate-key
  echo "GPG created"
  gpg --list-secret-keys --keyid-format=long
  echo "Copy from sec after / and run : gpg --armor --export KEYSTRING"
}

init_git(){
  # mkdir $XDG_CONFIG_HOME/git
  while true
  do
    if [[ -z $git_name ]]; then
      read -p "Default name: " git_name
    fi

    if [[ -z $git_email ]]; then
      read -p "Default email: " git_email
    else
      if ! [[ $git_email =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]; then
        echo "Must be valid email address"
        read -p "Default email: " git_email
      else
        if [[ -n $git_name ]] && [[ -n $git_email ]]; then
          break;
        fi
      fi
    fi
  done
  touch $XDG_CONFIG_HOME/git/config
  git config --global init.defaultBranch main
  git config --global pull.rebase true
  git config --global user.email $git_email
  git config --global user.name $git_name
  git config --global alias.last "log -n1"
  git config --global alias.logs "log --oneline -n 25"
  git config --global alias.changes "diff-tree --no-commit-id --name-only -r"
  git config --global alias.co "checkout"
  git config --global alias.ss "status"
  git config --global alias.pushf "push --force-with-lease"
  echo -e ".env\n\
.env.*\n\
!.env.example\n\
!.env.sample\n\
\n\
#pde\
.mise.*\n\
mise.*\n\
!.mise.local.toml\n\
\n\
#build\n\
**/build/\n\
build/\n\
**/dist/\n\
dist/\n\
\n\
#craps\n\
*.vim\n\
node_modules/*" > $XDG_CONFIG_HOME/git/ignore
}

echo "------------------------------------------------"
echo "Init yay"
init_yay

echo "------------------------------------------------"
echo "Generate sshkey"
gen_ssh
ssh-keygen -t   ed25519 -C "$email"
if ! [[ -d $HOME/.ssh ]]; then
  echo "something wrong"
fi

echo "------------------------------------------------"
echo "Generate GPG key"
gen_gpg

echo "------------------------------------------------"
echo "Init git config"
init_git
init submodule
git submodule update --init --recursive

echo "------------------------------------------------"
echo "Symlink dotfiles"
copy to config
find $DOTFILES -mindepth 1 -maxdepth 1 -not -iname ".git" -not -iname "personal" -type d -exec ln -s {} $XDG_CONFIG_HOME  \;
# specific dirs
ln -s -f $DOTFILES/personal/nvim $XDG_CONFIG_HOME
ln -s -f $DOTFILES/personal/scripts $HOME/.local

if [[ $? != 0 ]]; then
  echo "Error symlink"
  exit 0
fi

echo "------------------------------------------------"
echo "Install packages"
packages="$DOTFILES/packages.txt"
yay -S --needed - < $packages

if [ $(command -v docker) ]; then
  systemctl enable docker.service && systemctl start docker.service
fi

cd $HOME/repos
git clone https://github.com/nakst/gf.git
./build.sh

