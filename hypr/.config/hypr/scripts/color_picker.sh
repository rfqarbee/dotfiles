#!/bin/env bash

notif="$XDG_CONFIG_HOME/swaync/images/notif.png"
color=$(hyprpicker)

if [[ -n $color ]];then
	notify-send -t 36000 -u low -i "$notif" "Color" "$color"
fi
