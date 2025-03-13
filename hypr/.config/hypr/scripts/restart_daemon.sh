#!/bin/env bash

scripts=$XDG_CONFIG_HOME/hypr/scripts

if [[ $1 == '--all' ]]; then
    for pid in $(pidof waybar rofi swaync); do
        kill -SIGUSR1 "$pid"
    done
    sleep 1
    waybar &
else
    for pid in $(pidof rofi swaync); do
        kill -SIGUSR1 "$pid"
    done
fi

sleep 0.5
swaync > /dev/null 2>&1 &
${scripts}/wallust.sh &

exit 0
