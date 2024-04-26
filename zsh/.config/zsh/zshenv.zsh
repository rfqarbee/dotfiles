#PATH for ZSH
typeset -U path PATH
path=($HOME/bin /usr/local/bin $HOME/.local/bin $HOME/.local/scripts $path)
# cdpath=(. $HOME/Media/Pictures $HOME/.config $HOME/.local $HOME $HOME/code $HOME/Documents)
export PATH
## asdf
. "$HOME/.config/asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)

export GNUPGHOME=$HOME/.local/share/gnupg
# open man in neovim
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
export npm_config_prefix="$HOME/.local/npm"
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
