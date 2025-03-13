#!/bin/env bash

if [[ ! -d "$GRIM_DEFAULT_DIR" ]]; then
	mkdir -p "$GRIM_DEFAULT_DIR"
fi

time=$(date "+%d-%b_%H-%M-%S")
file="Screenshot_${time}.png"
listDP="$(hyprctl monitors | grep -i "monitor" | awk '{if(NR==1){s=$2}else{s=s "|" $2}}END{print s}')"

scripts="$XDG_CONFIG_HOME/hypr/scripts"

notify_mes="notify-send -t 10000 -A action1=Open -A action2=Delete -h string:x-canonical-private-synchronous:shot-notify"
screenshotted="${notify_mes} -i ${XDG_CONFIG_HOME}/picture.png "

# notify and view screenshot
notification() {
    if [[ "$1" == "swappy" ]]; then
		"${scripts}/system_sound.sh" --screenshot
		resp=$(${screenshotted} " Screenshot:" " Swappy")
		case "$resp" in
			action1)
				swappy -f - <"$tmpfile"
				;;
			action2)
				rm "$tmpfile"
				;;
		esac

    else
        local check_file="${GRIM_DEFAULT_DIR}/${file}"
        if [[ -e "$check_file" ]]; then
            "${scripts}/system_sound.sh" --screenshot
            resp=$(timeout 5 ${screenshotted} " Screenshot" " Saved")
			case "$resp" in
				action1)
					nsxiv "${check_file}" &
					;;
				action2)
					rm "${check_file}" &
					;;
			esac
        else
	notify-send -u low -i $XDG_CONFIG_HOME/swaync/images/notif.png  " Screenshot " " Cancelled"
            "${scripts}/system_sound.sh" --error
        fi
    fi
}

# fullscreen (all monitors)
full() {
	cd $GRIM_DEFAULT_DIR && grim - | tee "$file" | wl-copy
	sleep 2
	notification
}

active_win() {
	w_pos=$(hyprctl activewindow | grep 'at:' | cut -d':' -f2 | tr -d ' ' | tail -n1)
	w_size=$(hyprctl activewindow | grep 'size:' | cut -d':' -f2 | tr -d ' ' | tail -n1 | sed s/,/x/g)
	cd $GRIM_DEFAULT_DIR && grim -g "$w_pos $w_size" - | tee "$file" | wl-copy
	notification
}

area() {
	tmpfile=$(mktemp)
	grim -g "$(slurp)" - >"$tmpfile"
	if [[ -s "$tmpfile" ]]; then
		wl-copy <"$tmpfile"
		mv "$tmpfile" "$GRIM_DEFAULT_DIR/$file"
	fi
	notification
}


swappy() {
	tmpfile=$(mktemp)
	grim -g "$(slurp)" - >"$tmpfile" && notification "swappy"
}

monitor() {
	echo $listDP | rofi -sep '|' -dmenu -i -p "Screenshot Display" |
	while read userin; do
		sleep 1
		if [[ -n $userin ]] ; then
		cd $GRIM_DEFAULT_DIR && grim -o "$userin" - | tee "$file" | wl-copy
		fi
	done
	notification
}

if [[ "$1" == "--full" ]]; then
	full
elif [[ "$1" == "--win" ]]; then
	active_win
elif [[ "$1" == "--area" ]]; then
	area
elif [[ "$1" == "--swappy" ]]; then
	swappy
else
	monitor
fi

exit 0
