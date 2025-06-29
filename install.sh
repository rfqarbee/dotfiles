#!/usr/bin/env bash

sep="\n-----------------------------------------"
ignore=""
cur=$PWD
export DOTFILES=$cur
stow=$(find $PWD -mindepth 1 -maxdepth 1 -not -path "*/.git" -type d)
deps=("stow" "git")
reqdir=("repos" "dev" "work" "probe" "www")

if [[ -f "$DOTFILES/.configured" ]]; then
  echo "Nothing to do"
  exit
fi

for dir in "${reqdir[@]}";do
    if ! find $HOME/$dir -maxdepth 1 -type d &>/dev/null;then
        mkdir $HOME/$dir
    fi
done

for dep in ${deps[@]}; do
  command -v $dep &>/dev/null
  if [[ $? -gt 0 ]]; then
    echo "Install missing deps"
    sudo pacman -S $dep
  fi
done

for dirs in $stow; do
  curDir=$(basename $dirs)
  stow $curDir
done

cd $cur
echo -e $sep
echo "Path -> $cur"
echo "init submodule scripts + nvim"
sleep 1
#git submodule update --init --recursive --remote
# git submodule foreach git fetch
# git submodule foreach git checkout main
echo -e $sep
echo "init all required shit in sys"
sleep 1

./init.sh

if [[ $? -gt 0 ]]; then
  echo "fail"
  exit;
fi

echo "done"
