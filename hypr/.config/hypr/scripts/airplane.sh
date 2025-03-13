#!/bin/env bash

notif="$HOME/.config/swaync/images/ja.png"

wifi_blocked=$(rfkill list wifi | grep -o "Soft blocked: yes")

if [ -n "$wifi_blocked" ]; then
    rfkill unblock wifi
    notify-send -u low -i "$notif" " Airplane Mode: " "OFF"
else
    rfkill block wifi
    notify-send -u low -i "$notif" " Airplane Mode: " "ON"
fi

