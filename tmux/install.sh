#!/bin/sh

if [[ -d plugins ]]; then
  echo "plugins exist"
  exit 0
else
  mkdir plugins
  git clone https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins/tpm
fi

