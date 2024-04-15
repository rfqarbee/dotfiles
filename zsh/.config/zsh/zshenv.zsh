#PATH for ZSH

typeset -U path PATH

path=($HOME/bin /usr/local/bin $HOME/.local/bin $HOME/.local $path)
cdpath=(. $HOME $HOME/.config $HOME/.local)

export PATH
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export ZDOTDIR=$HOME/.config/zsh
export XDG_WORK_DIR=$HOME/code
export XDG_REPOS_DIR=$HOME/repos
export XDG_DOCUMENTS_DIR=$HOME/Documents
export XDG_DOWNLOAD_DIR=$HOME/Downloads

#npm
export npm_config_prefix="$HOME/.local"
# rust custom path
export CARGO_HOME=$HOME/.config/cargo
export RUSTUP_HOME=$HOME/.config/rustup

export MANPAGER="nvim +Man!"
