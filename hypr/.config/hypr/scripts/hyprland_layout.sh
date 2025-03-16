#!/usr/bin/env bash
# copy from jakoolits
notif="$XDG_CONFIG_HOME/swaync/images/notif.png"

LAYOUT=$(hyprctl -j getoption general:layout | jq '.str' | sed 's/"//g')

case $LAYOUT in
"master")
	hyprctl keyword general:layout dwindle
	hyprctl keyword unbind SUPER,J
	hyprctl keyword unbind SUPER,K
	hyprctl keyword bind SUPER,J,cyclenext
	hyprctl keyword bind SUPER,K,cyclenext,prev
	hyprctl keyword bind SUPER,O,togglesplit
  notify-send -e -u low -i "$notif" " Dwindle Layout"
	;;
"dwindle")
	hyprctl keyword general:layout master
	hyprctl keyword unbind SUPER,J
	hyprctl keyword unbind SUPER,K
	hyprctl keyword unbind SUPER,O
	hyprctl keyword bind SUPER,J,layoutmsg,cyclenext
	hyprctl keyword bind SUPER,K,layoutmsg,cycleprev
  notify-send -e -u low -i "$notif" " Master Layout"
	;;
*) ;;

esac
