#!/bin/bash
scripts=$HOME/.config/hypr/scripts

init_install() {
    extras=()
    aur=()
    while read -r out; do
	extras+=($out)
    done < ./extras.txt
    while read -r out; do
	aur+=($out)
    done < ./aur.txt
    sudo pacman -Sp ${extras[@]}

}

pacman () {
    opts=(
	"Color"
	"CheckSpace"
	"VerbosePkgLists"
	"ParallelDownloads"
    )

for line in "${opts[@]}"; do
    if grep -q "^#$line" "$pacman_conf"; then
        sudo sed -i "s/^#$line/$line/" "$pacman_conf"
        echo -e "Uncommented: $line ${RESET}" 2>&1 | tee -a "$LOG"
    else
        echo -e "$line is already uncommented. ${RESET}" 2>&1 | tee -a "$LOG"
    fi
done

# Add "ILoveCandy" below ParallelDownloads if it doesn't exist
if grep -q "^ParallelDownloads" "$pacman_conf" && ! grep -q "^ILoveCandy" "$pacman_conf"; then
    sudo sed -i "/^ParallelDownloads/a ILoveCandy" "$pacman_conf"
    echo -e "${CAT} Added ${MAGENTA}ILoveCandy${RESET} after ${MAGENTA}ParallelDownloads${RESET}. ${RESET}" 2>&1 | tee -a "$LOG"
else
    echo -e "${CAT} It seems ${YELLOW}ILoveCandy${RESET} already exists ${RESET} moving on.." 2>&1 | tee -a "$LOG"
fi

echo -e "${CAT} ${MAGENTA}Pacman.conf${RESET} spicing up completed ${RESET}" 2>&1 | tee -a "$LOG"


# updating pacman.conf
printf "\n%s - ${SKY_BLUE}Synchronizing Pacman Repo${RESET}\n" "${INFO}"
sudo pacman -Sy

}

init_hypr() {
    wallpaper=$HOME/.config/hypr/.current_wallpaper
    waybar="$HOME/.config/waybar/style/Dark-Half Moon.css"
    kvantum_theme="catppuccin-mocha-blue"
    color_scheme="prefer-dark"
    gtk_theme="Flat-Remix-GTK-Blue-Dark"
    icon_theme="Flat-Remix-Blue-Dark"
    cursor_theme="Bibata-Modern-Ice"
    swww="swww img"
    effect="--transition-bezier .43,1.19,1,.4 --transition-fps 30 --transition-type grow --transition-pos 0.925,0.977 --transition-duration 2"


    gsettings set org.gnome.desktop.interface color-scheme $color_scheme > /dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface gtk-theme $gtk_theme > /dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface icon-theme $icon_theme > /dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface cursor-theme $cursor_theme > /dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface cursor-size 24 > /dev/null 2>&1 &
    kvantummanager --set "$kvantum_theme" > /dev/null 2>&1 &

	if [ -f "$wallpaper" ]; then
		wallust run -s $wallpaper > /dev/null
		swww query || swww-daemon && $swww $wallpaper $effect
	    "$scripts/wallust.sh" > /dev/null 2>&1 &
	fi

	if [ -d "$HOME/.config/waybar/config" ]; then
       	ln -sf "$waybar" "$HOME/.config/waybar/style.css"
      	"$scripts/refresh_daemon.sh --all" > /dev/null 2>&1 &
	fi
}

init_dir() {
    personal=("repos" "dev" "probe" "work")
    for dir in "${personal[@]}";do
        if ! find $HOME/$dir -maxdepth 1 -type d &>/dev/null;then
            mkdir $HOME/$dir
        fi
    done

    #git
    mkdir $HOME/.config/git && touch $HOME/.config/git/{ignore,credentials,config}
    cd $HOME
    git config --global credential.helper store
    git config --global pull.rebase true
}

init_yay() {
    if sudo pacman -Qs yay-bin >/dev/null; then
	yay -Y --gendb
	yay -Syu --devel
    else
	echo "Install yay-bin or build from souce"
    fi
}

