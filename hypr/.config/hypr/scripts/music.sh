#!/usr/bin/env bash
# copy from jakoolit with some tweaks

icons="$XDG_CONFIG_HOME/swaync/icons"
theme="$XDG_CONFIG_HOME/rofi/launchers/util/search-list.rasi"

declare -A lists=(
  ["Lofi Radio"]="https://play.streamafrica.net/lofiradio"
  ["Lofi"]="https://www.youtube.com/live/jfKfPfyJRdk?si=PnJIA9ErQIAw6-qd"
  ["Fav"]="https://music.youtube.com/playlist?list=PLE5fjN1ZGxpxG-vvx8WzJufxd8fzayOfY&si=hbapO9zewv48u_OM"
  ["Chill"]="https://music.youtube.com/playlist?list=PLE5fjN1ZGxpy_VUBv00xVctGov2i3KZG7&si=yAjC-d_mbZkPdQgP"
  ["Nice"]="https://music.youtube.com/playlist?list=PLE5fjN1ZGxpwidB73wS07Pjxc9s6ixnNc&si=T0Ok5m5FY1Pg2Jm5"
  ["Jpop"]="https://music.youtube.com/playlist?list=PLE5fjN1ZGxpxOLNSPJknXIC8o48rZJGEj&si=kCNrOA222mq5_gl9"
)

notification() {
  notify-send -u normal -i "$icons/music.png" "Now Playing:" "$@"
}

stream_music() {
  choice=$(for list in "${!lists[@]}"; do
      echo $list
    done | sort | rofi -i -dmenu)

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

# local music
# populate local_music array with files from music directory and subdirectories
# populate_local_music() {
#   local_music=()
#   filenames=()
#   while IFS= read -r file; do
#     local_music+=("$file")
#     filenames+=("$(basename "$file")")
#   done < <(find -L "$mDIR" -type f \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.wav" -o -iname "*.ogg" -o -iname "*.mp4" \))
# }
# play_local_music() {
#   populate_local_music
#
#   # Prompt the user to select a song
#   choice=$(printf "%s\n" "${filenames[@]}" | rofi -i -dmenu -config $rofi_theme)
#
#   if [ -z "$choice" ]; then
#     exit 1
#   fi
#
#   # Find the corresponding file path based on user's choice and set that to play the song then continue on the list
#   for (( i=0; i<"${#filenames[@]}"; ++i )); do
#     if [ "${filenames[$i]}" = "$choice" ]; then
#
# 	    notification "$choice"
#
#       # Play the selected local music file using mpv
#       mpv --playlist-start="$i" --loop-playlist --vid=no  "${local_music[@]}"
#
#       break
#     fi
#   done
# }
# # Main function for shuffling local music
# shuffle_local_music() {
#   notification "Shuffle Play local music"
#
#   # Play music in $mDIR on shuffle
#   mpv --shuffle --loop-playlist --vid=no "$mDIR"
# }
