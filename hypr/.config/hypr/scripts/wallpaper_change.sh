#!/usr/bin/env bash

wallpaper="$HOME/Pictures/wallpapers"
scripts="$XDG_CONFIG_HOME/hypr/scripts"
images="$XDG_CONFIG_HOME/swaync/images/notif.png"

theme="$XDG_CONFIG_HOME/rofi/launchers/util/search-wallpaper.rasi"
focused_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')

scale_factor=$(hyprctl monitors -j | jq -r --arg mon "$focused_monitor" '.[] | select(.name == $mon) | .scale')
monitor_height=$(hyprctl monitors -j | jq -r --arg mon "$focused_monitor" '.[] | select(.name == $mon) | .height')

icon_size=$(echo "scale=1; ($monitor_height * 3) / ($scale_factor * 150)" | bc)

if ! command -v bc &>/dev/null; then
  notify-send -i "$images" "bc missing" "Install package bc first"
  exit 1
fi

FPS=60
TYPE="any"
DURATION=2
BEZIER=".43,1.19,1,.4"
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION --transition-bezier $BEZIER"

mapfile -d '' PICS < <(find -L "${wallpaper}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.pnm" -o -iname "*.tga" -o -iname "*.tiff" -o -iname "*.webp" -o -iname "*.bmp" -o -iname "*.farbfeld" -o -iname "*.png" -o -iname "*.gif" \) -print0)

RANDOM_PIC="${PICS[$((RANDOM % ${#PICS[@]}))]}"
RANDOM_PIC_NAME=". random"

launch="rofi -i -show -dmenu -config $theme"

# shameless copy from jakoolit
menu() {
  IFS=$'\n' sorted_options=($(sort <<<"${PICS[*]}"))
  # Place ". random" at the beginning with the random picture as an icon
  printf "%s\x00icon\x1f%s\n" "$RANDOM_PIC_NAME" "$RANDOM_PIC"
  for pic_path in "${sorted_options[@]}"; do
    pic_name=$(basename "$pic_path")
    # Displaying .gif to indicate animated images
    if [[ ! "$pic_name" =~ \.gif$ ]]; then
      printf "%s\x00icon\x1f%s\n" "$(echo "$pic_name" | cut -d. -f1)" "$pic_path"
    else
      printf "%s\n" "$pic_name"
    fi
  done
}

[[ -z $(pidof swww-daemon) ]] && swww-daemon --format xrgb

main() {
  opts=$(menu | $launch)

  opts=$(echo "$choice" | xargs)
  RANDOM_PIC_NAME=$(echo "$RANDOM_PIC_NAME" | xargs)

  if [[ -z "$opts" ]]; then
    exit 0
  fi

  # Random opts case
  if [[ "$opts" == "$RANDOM_PIC_NAME" ]]; then
      swww img -o "$focused_monitor" "$RANDOM_PIC" $SWWW_PARAMS;
      cp -r $RANDOM_PIC $XDG_CONFIG_HOME/hypr/.current_wallpaper
      sleep 2
      "$scripts/wallust.sh"
      sleep 0.5
      "$scripts/refresh_daemon.sh"
      exit 0
  fi

  pic_index=-1
  for i in "${!PICS[@]}"; do
    filename=$(basename "${PICS[$i]}")
    echo $filename
    if [[ "$filename" == "$opts"* ]]; then
      pic_index=$i
      break
    fi
  done

  if [[ $pic_index -ne -1 ]]; then
    swww img -o "$focused_monitor" "${PICS[$pic_index]}" $SWWW_PARAMS
      cp -r $RANDOM_PIC $XDG_CONFIG_HOME/hypr/.current_wallpaper
  else
    exit 1
  fi

}

if pidof rofi > /dev/null; then
  pkill rofi
fi

main
wait $!
"$scripts/wallust.sh" &&
wait $!
sleep 2
"$scripts/refresh_daemon.sh"
sleep 1
