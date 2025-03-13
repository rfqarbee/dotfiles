#!/bin/env bash

search="https://www.google.com/search?q={}"
theme="$XDG_CONFIG_HOME/rofi/launchers/util/search-bar.rasi"

tmp_search=$(mktemp)
sed 's/^\$//g; s/ = /=/g' "$search" > "$tmp_config_file"
source "$tmp_search"


if pgrep -x "rofi" >/dev/null; then
    pkill rofi
fi

echo "" | rofi -dmenu -config "$theme"| xargs -I{} xdg-open $search

rm "$tmp_search"
