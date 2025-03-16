#!/usr/bin/env bash
scripts=$HOME/.config/hypr/scripts
logs="$DOTFILE/_logs/logs"


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
    sudo systemctl enable --now fstrim.service &>> $logs
    sudo systemctl enable --now fstrim.timer &>> $logs
    #bluetooth
    sudo systemctl enable --now bluetooth.service &>> $logs
    # audio
    systemctl --user enable --now pipewire.socket pipewire-pulse.socket wireplumber.service &>> $logs
    systemctl --user enable --now pipewire.servce &>> $logs
    # sddm
    sudo systemctl enable sddm &>> $logs
    # firewall
    # futher can be read https://wiki.archlinux.org/title/Uncomplicated_Firewall
    sudo systemctl enable --now ufw.service &>> $logs
    sudo ufw default deny
    sudo ufw allow 192.168.0.0/24 # allow LAN
    sudo ufw allow Deluge # bittorrent
    sudo ufw limit ssh
    #network
    sudo systemctl enable --now NetworkManager.service &>> $logs
    sudo systemctl enable --now systemd-resolved.service &>> $logs
    sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

    conf=/etc/systemd/resolved.conf
    dns="8.8.8.8#dns.google 8.8.4.4#dns.google 2001:4860:4860::8888#dns.google 2001:4860:4860::8844#dns.google="
	if grep -q "^DNS=" $conf ; then
	    sudo sed -i "s/\(^DNS=\).*/DNS=$dns/" $conf
	    echo "Set DNS" >> $logs
	fi
	if grep -q "^DNSOverTLS=" $conf ; then
	    sudo sed -i "s/\(^DNSOverTLS=\).*/DNSOverTLS=yes/" $conf
	    echo "DNS over TLS : true" >> $logs
	fi
	if grep -q "^DNS=" $conf ; then
	    sudo sed -i "s/\(^DNSSEC=\).*/DNSSEC=yes/" $conf
	    echo "DNSSEC : true" >> $logs
	fi
}

init_nvidia() {
    sudo sed -Ei 's/^(MODULES=\([^\)]*)\)/\1 nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
    echo "Nvidia modules /etc/mkinitcpio.conf" >> $logs
    sudo mkinitcpio -P &>> $logs
    if [ ! $(find "/etc/modprobe.d/nvidia.conf" -type f) ];then
	 sudo echo -e "options nvidia_drm modeset=1 fbdev=1" | sudo tee -a /etc/modprobe.d/nvidia.conf 2>&1 | tee -a $logs
    fi

    # systemd-bootloader
    bootloader="/boot/loader/entries/arch.conf" # NOTE: *.conf change if different
    addopts=$(grep -w "^options" $bootloader | sed 's/\b nvidia-drm.modeset=[^ ]*\b//g' | sed 's/\b nvidia_drm.fbdev=[^ ]*\b//g' | sed 's/\b nvidia.NVreg_PreserveVideoMemoryAllocations=[^ ]*\b//g')
    sudo sed -i "/^options/c${addopts} nvidia-drm.modeset=1 nvidia_drm.fbdev=1 nvidia.NVreg_PreserveVideoMemoryAllocations=1" $bootloader &>> $logs

    # add pacman hooks
if [ ! $(find "/etc/pacman.d/hooks" -type d) ]; then
sudo mkdir -p /etc/pacman.d/hooks
hooks="nvidia.hook"
touch $hooks
cat > $hooks <<EOF
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia-dkms
#Target=nvidia
#Target=nvidia-open
Target=linux # change if different kernel

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
EOF
sudo mv $hooks /etc/pacman.d/hooks/$hooks
fi
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
	    echo -e "Toggle $line" &>> $logs
	else
	    echo -e "$line already toggled." &>> $logs
	fi
	   done

	   if grep -q "^ParallelDownloads" "$pacman_conf" && ! grep -q "^ILoveCandy" "$pacman_conf"; then
	       sudo sed -i "/^ParallelDownloads/a ILoveCandy" "$pacman_conf"
	       echo -e "Parellel downloads enable; Ilovecandy added" &>>$logs
	   else
	       echo -e "Already set, skip" &>>$logs
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
	    "$scripts/wallust.sh" &>>$logs &
	fi

	if [ -d "$HOME/.config/waybar/config" ]; then
	    ln -sf "$waybar" "$HOME/.config/waybar/style.css"
	    "$scripts/refresh_daemon.sh --all" &>> $logs &
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
    if [ $(command -v yay) ];then
	git clone https://aur.archlinux.org/yay-bin.git $HOME/repos/yay-bin
	cd $HOME/repos/yay-bin
	makepkg -si
    fi

    if sudo pacman -Qs yay-bin >/dev/null; then
	yay -Y --gendb
	yay -Syu --devel
	while read -r out; do
	    aur+=($out)
	done < ./aur.txt
	    if [[ ${#aur} -gt 0 ]]; then
		yes | yay -S ${aur[@]}
	    fi
    else
	echo "Install yay-bin or build from souce"
    fi
}

echo "Creating directories and init git"
init_dir
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
echo "Nvidia nightmare"
init_nvidia
sleep 2
echo "Init hyprland defaults"
init_hypr
