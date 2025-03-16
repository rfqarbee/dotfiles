#!/usr/bin/env bash

# i aint doing all this, copy from jakoolit
# just changed some variables
# look into it oneday (maybe)

theme="freedesktop" # theme system sounds.
user="$HOME/.local/share/sounds"
sound="/usr/share/sounds"
default="freedesktop"

mute=false
mutess=false
mutevol=false

if [[ "$mute" = true ]]; then
    exit 0
fi

# Choose the sound to play.
if [[ "$1" == "--screenshot" ]]; then
    if [[ "$mutess" = true ]]; then
        exit 0
    fi
    soundoption="screen-capture.*"
elif [[ "$1" == "--volume" ]]; then
    if [[ "$mutevol" = true ]]; then
        exit 0
    fi
    soundoption="audio-volume-change.*"
elif [[ "$1" == "--error" ]]; then
    if [[ "$mutess" = true ]]; then
        exit 0
    fi
    soundoption="dialog-error.*"
else
    echo -e "Available sounds: --screenshot, --volume, --error"
    exit 0
fi


set_theme="$sound/$default"

if [ -d "$user/$theme" ]; then
    set_theme="$user/$theme"
elif [ -d "$sound/$theme" ]; then
    set_theme="$sound/$theme"
fi

iTheme=$(cat "$set_theme/index.theme" | grep -i "inherits" | cut -d "=" -f 2)
iDIR="$set_theme/../$iTheme"

# Find the sound file and play it.
sound_file=$(find -L $set_theme/stereo -name "$soundoption" -print -quit)
if ! test -f "$sound_file"; then
    sound_file=$(find -L $iDIR/stereo -name "$soundoption" -print -quit)
    if ! test -f "$sound_file"; then
        sound_file=$(find -L $user/$default/stereo -name "$soundoption" -print -quit)
        if ! test -f "$sound_file"; then
            sound_file=$(find -L $sound/$default/stereo -name "$soundoption" -print -quit)
            if ! test -f "$sound_file"; then
                echo "Error: Sound file not found."
                exit 1
            fi
        fi
    fi
fi

# pipewire priority, fallback pulseaudio
pw-play "$sound_file" || pa-play "$sound_file"
