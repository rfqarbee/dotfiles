#!/usr/bin/env bash
# TODO: this
IFS=$'\n\t'

opts="$XDG_CONFIG_HOME/waybar/style"
current_style="$XDG_CONFIG_HOME/waybar/style.css"
scripts="$XDG_CONFIG_HOME/hypr/scripts"
theme="$XDG_CONFIG_HOME/rofi/launchers/util/search-list.rasi"

menu() {
    options=()
    while IFS= read -r file; do
        if [ -f "$opts/$file" ]; then
            options+=("$(basename "$file" .css)")
        fi
    done < <(find -L "$opts" -maxdepth 1 -type f -name '*.css' -exec basename {} \; | sort )

    printf '%s\n' "${options[@]}"
}

apply_style() {
    ln -sf "$opts/$1.css" "$current_style"
    "${scripts}/restart_daemon.sh" &
}

main() {
    choice=$(menu | rofi -i -dmenu -config $theme)

    if [[ -z "$choice" ]]; then
        exit 0
    fi

    apply_style "$choice"
}

if pgrep -x "rofi" >/dev/null; then
    pkill rofi
fi

main
