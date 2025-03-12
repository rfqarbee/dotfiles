#!/bin/env bash

search="https://www.google.com/search?q={}"

tmp_search=$(mktemp)
sed 's/^\$//g; s/ = /=/g' "$search" > "$tmp_config_file"
source "$tmp_search"

# Rofi theme and message
rofi_theme="$HOME/.config/rofi/config-search.rasi"

# Kill Rofi if already running before execution
if pgrep -x "rofi" >/dev/null; then
    pkill rofi
fi

# Open Rofi and pass the selected query to xdg-open for Google search
echo "" | rofi -dmenu -config "$rofi_theme"| xargs -I{} xdg-open $Search_Engine

# Clean up temporary file after sourcing
rm "$tmp_search"
