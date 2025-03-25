#!/usr/bin/env bash
theme="sugar-candy"
rofi_theme="$XDG_CONFIG_HOME/rofi/launchers/util/search-wallpaper.rasi"
sddm="/usr/share/sddm/themes/$theme"
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

opts=$(menu | rofi -i -p "Lockscreen" -show -dmenu -theme $rofi_theme)
if [[ -n "$opts" ]]; then
  if [ -d "$sddm" ]; then

	# Check if yad is running to avoid multiple yad notification
	if pidof yad > /dev/null; then
	  killall yad
	fi

    if yad --info --text="Set current wallpaper as SDDM background?" \
    --text-align=left \
    --title="lockscreen" \
    --timeout=10 \
    --timeout-indicator=right \
    --button="yad-yes:0" \
    --button="yad-no:1" \
    ; then

    val=$(rg --files $HOME/Pictures/wallpapers | rg -i $opts)
    cp $val $sddm/backgrounds/default
    cp $val $XDG_CONFIG_HOME/hypr/.sddm
    notify-send -i '$notif' 'SDDM' "Lockscreen changed $(basename -- $val)"
    fi
  fi
fi
