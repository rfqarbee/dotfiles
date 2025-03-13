#!/bin/env bash

file_exists() {
    if [ -e "$1" ]; then
        return 0
    else
        return 1
    fi
}

process=(waybar rofi swaync ags)
for ps in "${process[@]}"; do
    if pidof "${ps}" >/dev/null; then
        pkill "${ps}"
    fi
done

# added since wallust sometimes not applying
killall -SIGUSR2 waybar
killall -SIGUSR2 swaync

#ags -q && ags &

# some process to kill
for pid in $(pidof waybar rofi swaync swaybg); do
    kill -SIGUSR1 "$pid"
done

#Restart waybar
sleep 1
waybar &

# relaunch swaync
sleep 0.5
swaync > /dev/null 2>&1 &

exit 0
