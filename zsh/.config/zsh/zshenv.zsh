#PATH for ZSH
typeset -U path PATH
path=($HOME/bin /usr/local/bin $HOME/.local/bin $HOME/.local/scripts $path)
# cdpath=(. $HOME/Media/Pictures $HOME/.config $HOME/.local $HOME $HOME/code $HOME/Documents)
export PATH
## asdf
. "$HOME/.config/asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)

export GNUPGHOME=$HOME/.local/share/gnupg

# man sweet sweet flavour
export MANPAGER="nvim +Man!"
# grim
export GRIM_DEFAULT_DIR=$HOME/Media/Pictures/saved
# w3m
export W3M_DIR=$HOME/.cache/w3m
export WWW_HOME="google.com"
# asdf
export ASDF_DATA_DIR=$HOME/.config/asdf

# xdg
#export ZDOTDIR=$HOME/.config/zsh
export XDG_PICTURES_DIR=$HOME/Media/Pictures/
export XDG_BIN_HOME=$HOME/.local/bin

# XDG_DATA_DIRS is already defined
export XDG_CONFIG_DIRS=/etc/xdg

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# name's shit, wip on it
export XDG_WORK_DIR=$HOME/code
export XDG_REPOS_DIR=$HOME/repos
export XDG_DOCUMENTS_DIR=$HOME/Documents
export XDG_DOWNLOAD_DIR=$HOME/Downloads

export TMPDIR=/tmp/

# export mariadb hist ; i fucking hate it at $HOME
export MARIADB_HISTFILE=$HOME/.cache/mariadb_history

# npm
export npm_config_cache="$HOME/.cache/npm"
# rust custom path
export CARGO_HOME=$HOME/.config/cargo
export RUSTUP_HOME=$HOME/.config/rustup
# steam
export ASDF_PROTONGE_STEAM_COMPAT_DIR=~/.steam/steam/compatibilitytools.d/
# nvidia
export __GL_SHADER_DISK_CACHE_PATH=$HOME/.cache/nv
export TERMINAL=/usr/bin/kitty

export GTK2_RC_FILES="$HOME/.config/gtk-2.0"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
   --preview "bat --color=always --style=numbers --line-range=:500 {}"
   --height=60%
   --color=fg:#6fb1a9,fg+:#d0d0d0,bg:#121212,bg+:#262626
   --color=hl:#70b8ff,hl+:#71dbff,info:#afaf87,marker:#87ff00
   --color=prompt:#d7005f,spinner:#af5fff,pointer:#ff8519,header:#87afaf
   --color=border:#262626,label:#aeaeae,query:#d9d9d9
   --border="bold" --border-label="" --preview-window="border-rounded" --padding="1"
   --margin="1" --prompt="> " --marker=">" --pointer="◆"
   --separator="─" --scrollbar="│" --info="right"'
