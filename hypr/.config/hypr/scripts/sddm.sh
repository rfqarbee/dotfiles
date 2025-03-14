#!/bin/bash
mapfile -d '' PICS < <(find -L "$HOME/Pictures/wallpapers" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.pnm" -o -iname "*.tga" -o -iname "*.tiff" -o -iname "*.webp" -o -iname "*.bmp" -o -iname "*.farbfeld" -o -iname "*.png" -o -iname "*.gif" \) -print0)
menu() {
  # Sort the PICS array
  IFS=$'\n' sorted_options=($(sort <<<"${PICS[*]}"))

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

opts=$(menu | rofi -i -show -dmenu)
terminal=kitty
notif="$HOME/.config/swaync/images/notif.png"
if [[ -n "$opts" ]]; then
  sddm="/usr/share/sddm/themes/sequoia_2"
  if [ -d "$sddm" ]; then
	if pidof yad > /dev/null; then
	  killall yad
	fi

    if yad --info --text="Set as SDDM Background?"\
    --text-align=left \
    --title="Lockscreen Change" \
    --button="yad-yes:0" \
    --button="yad-no:1" \
    ; then

    val=$HOME/Pictures/wallpapers/$opts
    cp $val $sddm/backgrounds/default
    cp $val $XDG_CONFIG_HOME/hypr/.sddm
    notify-send -i '$notif' 'SDDM' 'Background SET'
    fi
  fi
fi
