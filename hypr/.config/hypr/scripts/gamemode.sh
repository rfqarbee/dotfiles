#!/usr/bin/env bash

notif="$HOME/.config/swaync/images/notif.png"
scripts="$HOME/.config/hypr/scripts"

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"

	hyprctl keyword "windowrule opacity 1 override 1 override 1 override, ^(.*)$"
    swww kill
    notify-send -e -u low -i "$notif" "Gamemode:" " Enabled"
    exit
else
	swww-daemon --format xrgb && swww img "$HOME/.config/rofi/.current_wallpaper" &
	sleep 0.1
	${scripts}/wallust.sh
	sleep 0.5
	${scripts}/restart_daemon.sh
    notify-send -e -u normal -i "$notif" "Gamemode:" " Disabled"
    exit
fi
hyprctl reload
    exit
