#!/usr/bin/env bash

scripts=$XDG_CONFIG_HOME/hypr/scripts

if [[ $1 == '--all' ]]; then
    for pid in $(pidof waybar rofi swaync); do
        if [[ -n $pid ]]; then
            kill -9 "$pid"
        fi
    done
    waybar
else
    for pid in $(pidof rofi swaync); do
        if [[ -n $pid ]]; then
            kill -9 "$pid"
        fi
    done
fi

sleep 0.5
swaync > /dev/null 2>&1 &
${scripts}/wallust.sh &

exit 0
