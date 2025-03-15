#!/bin/env bash
if [[ -n "$choice" ]]; then
  sddm_sequoia="/usr/share/sddm/themes/sequoia_2"
  if [ -d "$sddm_sequoia" ]; then

	# Check if yad is running to avoid multiple yad notification
	if pidof yad > /dev/null; then
	  killall yad
	fi

    if yad --info --text="Set current wallpaper as SDDM background?\n\nNOTE: This only applies to SEQUOIA SDDM Theme" \
    --text-align=left \
    --title="SDDM Background" \
    --timeout=5 \
    --timeout-indicator=right \
    --button="yad-yes:0" \
    --button="yad-no:1" \
    ; then

    # Check if terminal exists
    if ! command -v "$terminal" &>/dev/null; then
    notify-send -i "$images" "Missing $terminal" "Install $terminal to enable setting of wallpaper background"
    exit 1
    fi

    # Open terminal to enter password
    $terminal -e bash -c "echo 'Enter your password to set wallpaper as SDDM Background'; \
    sudo cp -r $wallpaper_current '$sddm_sequoia/backgrounds/default' && \
    notify-send -i '$images' 'SDDM' 'Background SET'"
    fi
  fi
fi
