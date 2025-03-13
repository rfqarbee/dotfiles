#!/bin/bash
# copy from jakoolit with some tweaks

icons="$HOME/.config/swaync/icons"
# theme="$HOME/.config/rofi/launchers/applaunch/applaunch.rasi"

declare -A online_music=(
  ["Radio - Lofi Girl 🎧🎶"]="https://play.streamafrica.net/lofiradio"
  ["YT - lofi hip hop radio beats 📹🎶"]="https://www.youtube.com/live/jfKfPfyJRdk?si=PnJIA9ErQIAw6-qd"
  ["YT - Relaxing Piano Music 🎹🎶"]="https://youtu.be/6H7hXzjFoVU?si=nZTPREC9lnK1JJUG"
  ["YT - Relaxing Piano Jazz Music 🎹🎶"]="https://youtu.be/85UEqRat6E4?si=jXQL1Yp2VP_G6NSn"
)

notification() {
  notify-send -u normal -i "$icons/music.png" " Now Playing:" " $@"
}

play_online_music() {
  choice=$(for online in "${!online_music[@]}"; do
      echo "$online"
    done | sort | rofi -i -dmenu)

  if [ -z "$choice" ]; then
    exit 1
  fi

  link="${online_music[$choice]}"

  notification "$choice"

  # Play the selected online music using mpv
  mpv --shuffle --vid=no "$link"
}

# Check if an online music process is running and send a notification, otherwise run the main function
pkill mpv && notify-send -u low -i "$icons/music.png" "Music stopped" || {

if pidof rofi > /dev/null; then
  pkill rofi
fi
play_online_music
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
