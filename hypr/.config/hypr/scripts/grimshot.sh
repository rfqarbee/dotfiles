#!/bin/env bash
time=$(date "+%d-%b_%H-%M-%S")
file="Screenshot_${time}_${RANDOM}.png"
listDP="󰄀 Selection|$(hyprctl monitors | grep -i "monitor" | awk '{if(NR==1){s=$2}else{s=s "|" $2}}END{print s}')"

icons="$HOME/.config/swaync/icons"
img="$HOME/.config/swaync/images"
script="$HOME/.config/hypr/scripts"

active_window_class=$(hyprctl -j activewindow | jq -r '(.class)')
active_window_file="Screenshot_${time}_${active_window_class}.png"
active_window_path="${GRIM_DEFAULT_DIR}/${active_window_file}"

notify_cmd_base="notify-send -t 10000 -A action1=Open -A action2=Delete -h string:x-canonical-private-synchronous:shot-notify"
notify_cmd_shot="${notify_cmd_base} -i ${icons}/picture.png "
notify_cmd_shot_win="${notify_cmd_base} -i ${icons}/picture.png "
notify_cmd_NOT="notify-send -u low -i ${img}/notif.png "

# notify and view screenshot
notify_view() {
    if [[ "$1" == "active" ]]; then
        if [[ -e "${active_window_path}" ]]; then
			"${script}/Sounds.sh" --screenshot
            resp=$(timeout 5 ${notify_cmd_shot_win} " Screenshot of:" " ${active_window_class} Saved.")
            case "$resp" in
				action1)
					xdg-open "${active_window_path}" &
					;;
				action2)
					rm "${active_window_path}" &
					;;
			esac
        else
            ${notify_cmd_NOT} " Screenshot of:" " ${active_window_class} NOT Saved."
            "${script}/Sounds.sh" --error
        fi

    elif [[ "$1" == "swappy" ]]; then
		"${script}/Sounds.sh" --screenshot
		resp=$(${notify_cmd_shot} " Screenshot:" " Captured by Swappy")
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
            "${script}/Sounds.sh" --screenshot
            resp=$(timeout 5 ${notify_cmd_shot} " Screenshot" " Saved")
			case "$resp" in
				action1)
					xdg-open "${check_file}" &
					;;
				action2)
					rm "${check_file}" &
					;;
			esac
        else
            ${notify_cmd_NOT} " Screenshot" " NOT Saved"
            "${script}/Sounds.sh" --error
        fi
    fi
}

# take shots
shotnow() {
	cd ${GRIM_DEFAULT_DIR} && grim - | tee "$file" | wl-copy
	sleep 2
	notify_view
}

shot5() {
	countdown '5'
	for sec in $(seq 5 -1 1); do
		notify-send -h string:x-canonical-private-synchronous:shot-notify -t 1000 -i "$icons"/timer.png  " Taking shot" " in: $sec secs"
		sleep 1
	done
	sleep 1 && cd ${GRIM_DEFAULT_DIR} && grim - | tee "$file" | wl-copy
	sleep 1
	notify_view
}

shotwin() {
	w_pos=$(hyprctl activewindow | grep 'at:' | cut -d':' -f2 | tr -d ' ' | tail -n1)
	w_size=$(hyprctl activewindow | grep 'size:' | cut -d':' -f2 | tr -d ' ' | tail -n1 | sed s/,/x/g)
	cd ${GRIM_DEFAULT_DIR} && grim -g "$w_pos $w_size" - | tee "$file" | wl-copy
	notify_view
}

shotarea() {
	tmpfile=$(mktemp)
	grim -g "$(slurp)" - >"$tmpfile"
	if [[ -s "$tmpfile" ]]; then
		wl-copy <"$tmpfile"
		mv "$tmpfile" "$GRIM_DEFAULT_DIR/$file"
	fi
	notify_view
}

shotactive() {
    active_window_class=$(hyprctl -j activewindow | jq -r '(.class)')
    active_window_file="Screenshot_${time}_${active_window_class}.png"
    active_window_path="${GRIM_DEFAULT_DIR}/${active_window_file}"

    hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - "${active_window_path}"
	sleep 1
    notify_view "active"
}

shotswappy() {
	tmpfile=$(mktemp)
	grim -g "$(slurp)" - >"$tmpfile" && notify_view "swappy"
}

if [[ ! -d "$GRIM_DEFAULT_DIR" ]]; then
	mkdir -p "$GRIM_DEFAULT_DIR"
fi

if [[ "$1" == "--now" ]]; then
	shotnow
elif [[ "$1" == "--in5" ]]; then
	shot5
elif [[ "$1" == "--win" ]]; then
	shotwin
elif [[ "$1" == "--area" ]]; then
	shotarea
elif [[ "$1" == "--active" ]]; then
	shotactive
elif [[ "$1" == "--swappy" ]]; then
	shotswappy
else
	echo -e "Available Options : --now --in5 --in10 --win --area --active --swappy"
fi

exit 0
