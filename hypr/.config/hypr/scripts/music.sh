#!/usr/bin/env bash
# copy from jakoolit with some tweaks

icons="$XDG_CONFIG_HOME/swaync/icons"
theme="$XDG_CONFIG_HOME/rofi/launchers/util/search-list.rasi"

declare -A lists=(
  ["Hipokrit"]="https://music.youtube.com/playlist?list=PLE5fjN1ZGxpyfx3lx97BmB1sCYtGV8Xai&si=kFVsKMSoEa65THN1"
  ["Therapy"]="https://music.youtube.com/playlist?list=PLE5fjN1ZGxpysoCzdcU2FX5CJsC1bvElq&si=kV2LsUeZNs4-0yCy"
  ["Lofi"]="https://www.youtube.com/live/jfKfPfyJRdk?si=PnJIA9ErQIAw6-qd"
)

notification() {
  notify-send -u normal -i "$icons/music.png" "Now Playing:" "$@"
}

stream_music() {
  choice=$(for list in "${!lists[@]}"; do
      echo $list
    done | sort | rofi -p Music -i -show -dmenu -theme $theme)

  if [ -z "$choice" ]; then
    exit 1
  fi

  link="${lists[$choice]}"
  notification "$choice"
  mpv --shuffle --vid=no "$link"
}

# Check if an online music process is running and send a notification, otherwise run the main function
pkill mpv && notify-send -u low -i "$icons/music.png" "Music stopped" || {

if pidof rofi > /dev/null; then
  pkill rofi
fi
  stream_music
}
