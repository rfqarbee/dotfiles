#PATH for ZSH

typeset -U path PATH

path=($HOME/bin /usr/local/bin $HOME/.local/bin $path)
cdpath=(. $HOME $HOME/.config $HOME/.local)

# oh-my-zsh installation
# export ZSH="$HOME/.config/oh-my-zsh"

export PATH
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export ZDOTDIR=$HOME/.config/zsh

