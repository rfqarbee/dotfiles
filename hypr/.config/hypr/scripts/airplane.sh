#!/usr/bin/env bash

notif="$XDG_CONFIG_HOME/swaync/images/notif.png"

wifi_blocked=$(rfkill list wifi | grep -o "Soft blocked: yes")

if [ -n "$wifi_blocked" ]; then
    rfkill unblock wifi
    notify-send -u low -i "$notif" " Airplane Mode: " "OFF"
else
    rfkill block wifi
    notify-send -u low -i "$notif" " Airplane Mode: " "ON"
fi

