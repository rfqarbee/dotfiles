#!/bin/sh

# shitty script for shitty disk
# my disk is shitty, i aint cat README everytime

if [[ $PWD != "~/.config/tmux" ]]; then
  cd $XDG_CONFIG_HOME/tmux
fi

if [[ -d plugins ]]; then
  echo "plugins exist"
  exit 0
else
  mkdir plugins
  git clone https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins
fi

