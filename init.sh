#!/bin/bash
scripts=$HOME/.config/hypr/scripts
logs="./_logs/logs"

init_install() {
    extras=()
    aur=()
    while read -r out; do
	extras+=($out)
    done < ./extras.txt
    if [[ ${#extras} -gt 0 ]]; then
	yes | sudo pacman -Sp ${extras[@]}
    fi
}

# no checking since installing it barebone
init_daemon(){
    # ssd
    sudo systemctl enable --now fstrim.service 2>&1 | tee -a $logs
    sudo systemctl enable --now fstrim.timer 2>&1 | tee -a $logs
    #bluetooth
    sudo systemctl enable --now bluetooth.service 2>&1 | tee -a $logs
    # audio
    systemctl --user enable --now pipewire.socket pipewire-pulse.socket wireplumber.service 2>&1 | tee -a $logs
    systemctl --user enable --now pipewire.servce 2>&1 | tee -a $logs
    # sddm
    sudo systemctl enable sddm 2>&1 | tee -a $logs
    # firewall
    # futher can be read https://wiki.archlinux.org/title/Uncomplicated_Firewall
    sudo systemctl enable --now ufw.service 2>&1 | tee -a $logs
    sudo ufw default deny
    sudo ufw allow 192.168.0.0/24 # allow LAN
    sudo ufw allow Deluge # bittorrent
    sudo ufw limit ssh
    #network
    sudo systemctl enable --now NetworkManager.service 2>&1 | tee -a $logs
}

pacman() {
    pacman_conf="/etc/pacman.conf"
    opts=(
	"Color"
	"CheckSpace"
	"VerbosePkgLists"
	"ParallelDownloads"
    )

    for line in "${opts[@]}"; do
	if grep -q "^#$line" "$pacman_conf"; then
	    sudo sed -i "s/^#$line/$line/" "$pacman_conf"
	    echo -e "Toggle $line" | tee -a "$log"
	else
	    echo -e "$line already toggled." | tee -a "$log"
	fi
    done

    if grep -q "^ParallelDownloads" "$pacman_conf" && ! grep -q "^ILoveCandy" "$pacman_conf"; then
	sudo sed -i "/^ParallelDownloads/a ILoveCandy" "$pacman_conf"
	echo -e "Parellel downloads enable; Ilovecandy added" | tee -a "$log"
    else
	echo -e "Already set, skip" | tee -a "$log"
    fi
	echo "synching pacman..."
	sudo pacman -Syu
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
	    "$scripts/wallust.sh" 2>&1  | tee -a $logs &
	fi

	if [ -d "$HOME/.config/waybar/config" ]; then
	    ln -sf "$waybar" "$HOME/.config/waybar/style.css"
	    "$scripts/refresh_daemon.sh --all" 2>&1 | tee -a $logs &
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
    sudo pacman -S yay-bin
    if sudo pacman -Qs yay-bin >/dev/null; then
	yay -Y --gendb
	yay -Syu --devel
	while read -r out; do
	    aur+=($out)
	done < ./aur.txt
	if [ $(command -v yay) ];then
	    if [[ ${#aur} -gt 0 ]]; then
		yes | yay -S ${aur[@]}
	    fi
	fi
    else
	echo "Install yay-bin or build from souce"
    fi
}

echo "Pacman conf"
pacman
sleep 2
echo "Init Yay"
init_yay
sleep 2
echo "Install packages"
init_intall
sleep 2
echo "Init services"
init_daemon
sleep 2
echo "Creating directories and init git"
init_dir
echo "Init hyprland defaults"
init_hypr

