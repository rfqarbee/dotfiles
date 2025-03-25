#!/usr/bin/env bash
scripts=$HOME/.config/hypr/scripts


init_install () {
    yes | sudo pacman -S $(cat ./extras.txt)
}

init_user() {
    sudo usermod -aG games,wheel $whoami
}

# no checking since installing it barebone
init_daemon(){
    # ssd
    sudo systemctl enable --now fstrim.timer
    #bluetooth
    sudo systemctl enable --now bluetooth.service
    # sddm
    sudo systemctl enable sddm
    # firewall
    # futher can be read https://wiki.archlinux.org/title/Uncomplicated_Firewall
    sudo systemctl enable --now ufw.service
    sudo ufw default deny
    sudo ufw allow from 192.168.0.0/24 # allow LAN
    sudo ufw allow Deluge # bittorrent
    sudo ufw limit ssh

    #network
    sudo systemctl enable --now NetworkManager.service
    sudo systemctl enable --now systemd-resolved.service
    sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

    conf=/etc/systemd/resolved.conf
    dns="8.8.8.8#dns.google 8.8.4.4#dns.google 2001:4860:4860::8888#dns.google 2001:4860:4860::8844#dns.google="
    fallback="1.1.1.1#cloudflare-dns.com 9.9.9.9#dns.quad9.net 8.8.8.8#dns.google 2606:4700:4700::1111#cloudflare-dns.com 2620:fe::9#dns.quad9.net 2001:4860:4860::8888#dns.google"
	if grep -q "^DNS=" $conf ; then
	    sudo sed -i "s/\(^DNS=\).*/DNS=$dns/" $conf
	fi
	if grep -q "^FallbackDNS=" $conf ; then
	    sudo sed -i "s/\(^FallbackDNS=\).*/FallbackDNS=$fallback/" $conf
	fi
	if grep -q "^DNSOverTLS=" $conf ; then
	    sudo sed -i "s/\(^DNSOverTLS=\).*/DNSOverTLS=opportunistic/" $conf
	fi
	if grep -q "^Domains=" $conf ; then
	    sudo sed -i "s/\(^Domains=\).*/Domains=~\./" $conf
	fi
	# if grep -q "^DNSSEC=" $conf ; then
	#     sudo sed -i "s/\(^DNSSEC=\).*/DNSSEC=yes/" $conf
	# fi
}

init_nvidia() {
    sudo sed -Ei 's/^(MODULES=\([^\)]*)\)/\1 nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
    # dont forget to remove kms
    # sudo mkinitcpio -P
    if [ ! $(find "/etc/modprobe.d/nvidia.conf" -type f) ];then
	 sudo echo -e "options nvidia_drm modeset=1 fbdev=1" | sudo tee -a /etc/modprobe.d/nvidia.conf
    fi

    # systemd-bootloader
    bootloader="/boot/loader/entries/arch.conf" # NOTE: *.conf change if different
    nvidia-drm.modeset=1 nvidia-drm.fbdev=1
    addopts=$(grep -w "^options" $bootloader | sed 's/\b nvidia-drm.modeset=[^ ]*\b//g' | sed 's/\b nvidia-drm.fbdev=[^ ]*\b//g')
    sudo sed -i "/^options/c${addopts} nvidia-drm.modeset=1 nvidia-drm.fbdev=1" $bootloader

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
Target=nvidia
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

init_pacman() {
    pacman_conf="/etc/pacman.conf"
    opts=(
	"Color"
	"CheckSpace"
	"VerbosePkgLists"
	# "ParallelDownloads"
    )

	   for line in "${opts[@]}"; do
	if grep -q "^#$line" "$pacman_conf"; then
	    sudo sed -i "s/^#$line/$line/" "$pacman_conf"
	    echo -e "Toggle $line"
	else
	    echo -e "$line already toggled."
	fi
	   done

	   # if grep -q "^ParallelDownloads" "$pacman_conf" && ! grep -q "^ILoveCandy" "$pacman_conf"; then
	   # if ! grep -q "^ILoveCandy" "$pacman_conf"; then
	   #     sudo sed -i "/^ParallelDownloads/a ILoveCandy" "$pacman_conf"
	   #     echo -e "Parellel downloads enable; Ilovecandy added"
	   # else
	   #     echo -e "Already set, skip"
	   # fi
	   echo "synching pacman..."
	   sudo pacman -Syu
}

init_hypr() {
    wallpaper=$HOME/.config/hypr/.current_wallpaper
    waybar="$HOME/.config/waybar/style/Dark-Half Moon.css"
    kvantum_theme="catppuccin-mocha-blue"
    color_scheme="prefer-dark"
    gtk_theme="Breeze-Dark"
    icon_theme="Breeze-Dark"
    cursor_theme="Breeze"
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
	    "$scripts/wallust.sh"
	fi

	if [ -d "$HOME/.config/waybar/config" ]; then
	    ln -sf "$waybar" "$HOME/.config/waybar/style.css"
	    "$scripts/refresh_daemon.sh --all"
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
    if [ ! $(command -v yay) ];then
	git clone https://aur.archlinux.org/yay-bin.git $HOME/repos/yay-bin
	cd $HOME/repos/yay-bin
	makepkg -si
    fi

    if sudo pacman -Qs yay >/dev/null; then
	yay -Y --gendb
	yay -Syu --devel
	# yes | yay -S $(cat ./aur.txt)
    else
	echo "Install yay-bin or build from souce"
    fi
}

echo "Creating directories and init git"
init_dir
echo "Pacman conf"
init_pacman
sleep 2
echo "Init Yay"
init_yay
sleep 2
echo "Install packages"
init_install
sleep 2
echo "Init services"
init_daemon
sleep 2
echo "Nvidia nightmare"
init_nvidia
sleep 2
echo "Init hyprland defaults"
init_hypr
