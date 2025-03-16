#!/usr/bin/env bash

icons="$XDG_CONFIG_HOME/swaync/icons"
notification_timeout=1000
step=5

get_icon() {
	current=$(brightnessctl -m | cut -d, -f4 | sed 's/%//')
	if   [ "$current" -le "20" ]; then
		icon="$icons/brightness-20.png"
	elif [ "$current" -le "40" ]; then
		icon="$icons/brightness-40.png"
	elif [ "$current" -le "60" ]; then
		icon="$icons/brightness-60.png"
	elif [ "$current" -le "80" ]; then
		icon="$icons/brightness-80.png"
	else
		icon="$icons/brightness-100.png"
	fi
}

change_backlight() {
	local current_brightness
	current_brightness=$(get_backlight)

	# Calculate new brightness
	if [[ "$1" == "+${step}%" ]]; then
		new_brightness=$((current_brightness + step))
	elif [[ "$1" == "${step}%-" ]]; then
		new_brightness=$((current_brightness - step))
	fi

	# Ensure new brightness is within valid range
	if (( new_brightness < 5 )); then
		new_brightness=5
	elif (( new_brightness > 100 )); then
		new_brightness=100
	fi

	brightnessctl set "${new_brightness}%"
	get_icon
	current=$new_brightness
	notify-send -e -h string:x-canonical-private-synchronous:brightness_notif -h int:value:$current -u low -i $icon "Screen" "Brightness:$current%"
}

case "$1" in
	"--get")
		get_backlight
		;;
	"--inc")
		change_backlight "+${step}%"
		;;
	"--dec")
		change_backlight "${step}%-"
		;;
	*)
		get_backlight
		;;
esac
