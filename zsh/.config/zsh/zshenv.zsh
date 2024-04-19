#PATH for ZSH
typeset -U path PATH

path=($HOME/bin /usr/local/bin $HOME/.local/bin $HOME/.local $path)
cdpath=(. $HOME $HOME/.config $HOME/.local/scripts)

export PATH

# nvidia
export __GL_SHADER_DISK_CACHE_PATH=$HOME/.cache/nv

# w3m
export W3M_DIR=$HOME/.cache/w3m
export WWW_HOME="google.com"

export ZDOTDIR=$HOME/.config/zsh
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_BIN_HOME=$HOME/.local/bin

# name's shit, wip on it
export XDG_WORK_DIR=$HOME/code
export XDG_REPOS_DIR=$HOME/repos
export XDG_DOCUMENTS_DIR=$HOME/Documents
export XDG_DOWNLOAD_DIR=$HOME/Downloads

# export mariadb hist ; i fucking hate it at $HOME
export MARIADB_HISTFILE=$HOME/.cache/mariadb_history

# npm
export npm_config_prefix="$HOME/.local"
# rust custom path
export CARGO_HOME=$HOME/.config/cargo
export RUSTUP_HOME=$HOME/.config/rustup

# open man in neovim
export MANPAGER="nvim +Man!"
