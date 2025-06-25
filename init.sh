#!/usr/bin/env bash

set -e

# TODO
# init_nvidia() {
#     sudo sed -Ei 's/^(MODULES=\([^\)]*)\)/\1 nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
#     # dont forget to remove kms
#     # sudo mkinitcpio -P
#     if [ ! $(find "/etc/modprobe.d/nvidia.conf" -type f) ];then
# 	 sudo echo -e "options nvidia_drm modeset=1 fbdev=1" | sudo tee -a /etc/modprobe.d/nvidia.conf
#     fi
#
#     # systemd-bootloader
#     bootloader="/boot/loader/entries/arch.conf" # NOTE: *.conf change if different
#     nvidia-drm.modeset=1 nvidia-drm.fbdev=1
#     addopts=$(grep -w "^options" $bootloader | sed 's/\b nvidia-drm.modeset=[^ ]*\b//g' | sed 's/\b nvidia-drm.fbdev=[^ ]*\b//g')
#     sudo sed -i "/^options/c${addopts} nvidia-drm.modeset=1 nvidia-drm.fbdev=1" $bootloader
#
#     # add pacman hooks
# if [ ! $(find "/etc/pacman.d/hooks" -type d) ]; then
# sudo mkdir -p /etc/pacman.d/hooks
# hooks="nvidia.hook"
# touch $hooks
# cat > $hooks <<EOF
# [Trigger]
# Operation=Install
# Operation=Upgrade
# Operation=Remove
# Type=Package
# Target=nvidia
# Target=linux # change if different kernel
#
# [Action]
# Description=Update Nvidia module in initcpio
# Depends=mkinitcpio
# When=PostTransaction
# NeedsTargets
# Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
# EOF
# sudo mv $hooks /etc/pacman.d/hooks/$hooks
# fi
# }

init_user() {
  sudo usermod -aG games,wheel,audio,input,kvm,video,docker,gamemode $whoami
}

init_yay() {
  sudo pacman -S --needed base-devel git
  git clone https://aur.archlinux.org/yay-bin.git $HOME/repos
  cd $HOME/repos/yay-bin
  makepkg -si
  yay -Y --gendb
  yay -Syu --devel
  yay -Y --devel --save
}

ins_pkgs(){
  yes | yay -S $(cat ./pkgs.txt) --needed
}

# init_pacman() {
#   pacman_conf="/etc/pacman.conf"
#   opts=("Color" "CheckSpace" "VerbosePkgLists")
#   opts=("Color" "CheckSpace" "VerbosePkgLists" "ParallelDownloads")
#
#   for line in "${opts[@]}"; do
#     if grep -q "^#$line" "$pacman_conf"; then
#       sudo sed -i "s/^#$line/$line/" "$pacman_conf"
#       echo -e "Toggle $line"
#     else
#       echo -e "$line already toggled."
#     fi
#   done
#
#   # if grep -q "^ParallelDownloads" "$pacman_conf" && ! grep -q "^ILoveCandy" "$pacman_conf"; then
#   #   if ! grep -q "^ILoveCandy" "$pacman_conf"; then
#   #       sudo sed -i "/^ParallelDownloads/a ILoveCandy" "$pacman_conf"
#   #       echo -e "Parellel downloads enable; Ilovecandy added"
#   #   else
#   #       echo -e "Already set, skip"
#   #   fi
#   # fi
#   echo "Synching pacman"
#   sudo pacman -Syu
# }

init_hyprland() {
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
    "$HOME/.config/hypr/scripts/wallust.sh"
  fi

  if [ -d "$HOME/.config/waybar/config" ]; then
    ln -sf "$waybar" "$HOME/.config/waybar/style.css"
    "$HOME/.config/hypr/scripts/refresh_daemon.sh --all"
  fi
}

# init_daemon(){
#   # ufw
#   if command -v ufw; then
#     sudo systemctl enable ufw.service
#     sudo systemctl start ufw.service
#     sudo ufw default deny
#     sudo ufw allow from 192.168.0.0/24 # allow LAN
#     sudo ufw allow Deluge # bittorrent
#     sudo ufw limit ssh
#     sudo ufw enable
#     sudo ufw status
#     sleep 2
#   fi
#
#   # ssd
#   if command -v fstrim; then
#     sudo systemctl enable fstrim.timer
#     sleep 2
#   fi
#
#   # Network Manager
#   if command -v NetworkManager; then
#     sudo systemctl enable --now NetworkManager.service
#     sudo systemctl enable --now systemd-resolved.service
#     sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
#     conf=/etc/systemd/resolved.conf
#     dns="8.8.8.8#dns.google 8.8.4.4#dns.google 2001:4860:4860::8888#dns.google 2001:4860:4860::8844#dns.google="
#     fallback="1.1.1.1#cloudflare-dns.com 9.9.9.9#dns.quad9.net 8.8.8.8#dns.google 2606:4700:4700::1111#cloudflare-dns.com 2620:fe::9#dns.quad9.net 2001:4860:4860::8888#dns.google"
#
#     if grep -q "^DNS=" $conf ; then
#       sudo sed -i "s/\(^DNS=\).*/DNS=$dns/" $conf
#     fi
#     if grep -q "^FallbackDNS=" $conf ; then
#       sudo sed -i "s/\(^FallbackDNS=\).*/FallbackDNS=$fallback/" $conf
#     fi
#     if grep -q "^DNSOverTLS=" $conf ; then
#       sudo sed -i "s/\(^DNSOverTLS=\).*/DNSOverTLS=opportunistic/" $conf
#     fi
#     if grep -q "^Domains=" $conf ; then
#       sudo sed -i "s/\(^Domains=\).*/Domains=~\./" $conf
#     fi
#     sleep 2
#   fi
#
#   sudo systemctl enable bluetooth.service
#   sleep 2
#   sudo systemctl enable sddm
#   sleep 2
# }

# init_user
# echo "Current group"
# echo $(groups $whoami)
# sleep 1
# init_pacman
# echo -e "\npacman configured..."
# sleep 1
# init_yay
# echo -e "\nyay configured..."
# sleep 1
# echo -e "\ninstall packages..."
# ins_pkgs
# echo -e "\nEnable services"
# init_daemon
echo -e "\ninit hyprland"
init_hyprland

touch .configured
