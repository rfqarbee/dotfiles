#!/bin/env bash
theme="$XDG_CONFIG_HOME/rofi/launchers/clipboard/clipboard-v1.rasi"
msg='Ctrl+Delete | Alt+Delete (all)'

if pidof rofi > /dev/null; then
    pkill rofi
fi

while true; do
    result=$(
    rofi -i -dmenu -p "Clipboard"\
        -kb-custom-1 "Control-Delete" \
        -kb-custom-2 "Alt-Delete" \
        -config $theme < <(cliphist list) \
        -mesg "$msg"
    )

    case "$?" in
        1)
            exit
        ;;
        0)
            case "$result" in
        "")
            continue
        ;;
        *)
            cliphist decode <<<"$result" | wl-copy
            exit
            ;;
            esac
            ;;
        10)
            cliphist delete <<<"$result"
        ;;
        11)
            cliphist wipe
        ;;
    esac
done

