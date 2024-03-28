#PATH for ZSH

typeset -U path PATH

path=($HOME/bin /usr/local/bin $HOME/.local/bin $path)
cdpath=(. $HOME $HOME/.config $HOME/.local)

export PATH
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export ZDOTDIR=$HOME/.config/zsh

# apparently, need to install rust from pacman due to paru
# rust custom path
 export CARGO_HOME=$HOME/.config/cargo
 export RUSTUP_HOME=$HOME/.config/rustup

