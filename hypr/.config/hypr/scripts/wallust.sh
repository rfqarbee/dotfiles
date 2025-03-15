#!/bin/env bash

cur_mon=$(hyprctl monitors | awk '/^Monitor/{name=$2} /focused: yes/{print name}')
curr_file="$XDG_CACHE_HOME/swww/$cur_mon"

if [ -f "$curr_file" ]; then
    wallpaper_path=$(grep -v 'Lanczos3' "$curr_file" | head -n 1)
    if ln -sf "$wallpaper_path" "$XDG_CONFIG_HOME/rofi/images/.current_wallpaper"; then
      wallust run "$wallpaper_path" -s &
    fi
fi
