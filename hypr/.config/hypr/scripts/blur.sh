#!/bin/bash

notif="$HOME/.config/swaync/images/notif.png"

cur=$(hyprctl -j getoption decoration:blur:passes | jq ".int")

if [ "${cur}" == "2" ]; then
	hyprctl keyword decoration:blur:size 2
	hyprctl keyword decoration:blur:passes 1
 	notify-send -e -u low -i "$notif" " Less Blur"
else
	hyprctl keyword decoration:blur:size 5
	hyprctl keyword decoration:blur:passes 2
  	notify-send -e -u low -i "$notif" " Normal Blur"
fi
