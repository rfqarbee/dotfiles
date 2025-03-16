#!/usr/bin/env bash
theme="sequoia_2"
sddm="/usr/share/sddm/themes/$theme"
opts=$(menu | rofi -i -show -dmenu)
notif="$HOME/.config/swaync/images/notif.png"

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

if [[ -n "$opts" ]]; then
  if [ -d "$sddm" ]; then

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

    val="$HOME/Pictures/wallpapers/$opts.png"
      if sed -i "s#=\(.*\)#=${val}#g" $sddm/theme.conf.user 2>/dev/null; then
	notify-send -i '$notif' 'SDDM' "Lockscreen changed $opts"
      fi
    fi
  fi
fi
