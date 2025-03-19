#!/usr/bin/env bash
# i aint doing all the color palettes
# credits to jakoolit

effect="--transition-bezier .43,1.19,1,.4 --transition-fps 60 --transition-type grow --transition-pos 0.925,0.977 --transition-duration 2"
swww="swww img"

notif="$XDG_CONFIG_HOME/swaync/images/bell.png"
pallete_dark="dark16"
pallete_light="light16"
themes=()
icons=()
gtk_themes_directory="$XDG_DATA_HOME/themes"
icon_directory="$XDG_DATA_HOME/icons"

# reference https://wiki.archlinux.org/title/GTK
color_setting="org.gnome.desktop.interface color-scheme"
theme_setting="org.gnome.desktop.interface gtk-theme"
icon_setting="org.gnome.desktop.interface icon-theme"

hypr_config_path="$XDG_CONFIG_HOME/hypr"
swaync_style="$XDG_CONFIG_HOME/swaync/style.css"
scripts="$XDG_CONFIG_HOME/hypr/scripts"
wallust_rofi="$XDG_CONFIG_HOME/wallust/templates/colors-rofi.rasi"
wallust_config="$XDG_CONFIG_HOME/wallust/wallust.toml"
# ags_style="$XDG_CONFIG_HOME/ags/user/style.css"

# intial kill process
for pid in waybar rofi swaync; do
    killall -SIGUSR1 "$pid"
done

[[ -z $(pidof swww-daemon) ]] && swww-daemon --format xrgb

if [ "$(cat $XDG_CACHE_HOME/.theme_mode)" = "Light" ]; then
    theme_mode="Dark"
else
    theme_mode="Light"
fi

# replace the wallust palette config
if [ "$theme_mode" = "Dark" ]; then
    sed -i 's/^palette = .*/palette = "'"$pallete_dark"'"/' "$wallust_config"
else
    sed -i 's/^palette = .*/palette = "'"$pallete_light"'"/' "$wallust_config"
fi

set_waybar_style() {
    theme="$1"
    styles="$XDG_CONFIG_HOME/waybar/style"
    current_style="$XDG_CONFIG_HOME/waybar/style.css"
    prefix="($theme_mode).*\\.css$"

    file=$(find -L "$styles" -maxdepth 1 -type f -regex ".*$prefix" | shuf -n 1)

    if [ -n "$file" ]; then
        ln -sf "$file" "$current_style"
    else
        notify-send -u low -i "$notif" "Theme Mode Failed " " No Style for $theme_mode mode"
    fi
}

set_waybar_style "$theme_mode"
notify-send -u low -i "$notif" "Switching to" " $theme_mode mode"


# swaync color change
if [ "$theme_mode" = "Dark" ]; then
    sed -i '/@define-color noti-bg/s/rgba([0-9]*,\s*[0-9]*,\s*[0-9]*,\s*[0-9.]*);/rgba(0, 0, 0, 0.8);/' "${swaync_style}"
else
    sed -i '/@define-color noti-bg/s/rgba([0-9]*,\s*[0-9]*,\s*[0-9]*,\s*[0-9.]*);/rgba(255, 255, 255, 0.9);/' "${swaync_style}"
fi

# ags color change
if command -v ags >/dev/null 2>&1; then
    if [ "$theme_mode" = "Dark" ]; then
        sed -i '/@define-color noti-bg/s/rgba([0-9]*,\s*[0-9]*,\s*[0-9]*,\s*[0-9.]*);/rgba(0, 0, 0, 0.4);/' "${ags_style}"
	    sed -i '/@define-color text-color/s/rgba([0-9]*,\s*[0-9]*,\s*[0-9]*,\s*[0-9.]*);/rgba(255, 255, 255, 0.7);/' "${ags_style}"
	    sed -i '/@define-color noti-bg-alt/s/#.*;/#111111;/' "${ags_style}"
    else
        sed -i '/@define-color noti-bg/s/rgba([0-9]*,\s*[0-9]*,\s*[0-9]*,\s*[0-9.]*);/rgba(255, 255, 255, 0.4);/' "${ags_style}"
        sed -i '/@define-color text-color/s/rgba([0-9]*,\s*[0-9]*,\s*[0-9]*,\s*[0-9.]*);/rgba(0, 0, 0, 0.7);/' "${ags_style}"
	    sed -i '/@define-color noti-bg-alt/s/#.*;/#F0F0F0;/' "${ags_style}"
    fi
fi

# Set Kvantum Manager theme & QT5/QT6 settings
if [ "$theme_mode" = "Dark" ]; then
    kvantum_theme="catppuccin-mocha-blue"
else
    kvantum_theme="catppuccin-latte-blue"
fi

sed -i "s|^color_scheme_path=.*$|color_scheme_path=$qt5ct_color_scheme|" "$XDG_CONFIG_HOME/qt5ct/qt5ct.conf"
sed -i "s|^color_scheme_path=.*$|color_scheme_path=$qt6ct_color_scheme|" "$XDG_CONFIG_HOME/qt6ct/qt6ct.conf"
kvantummanager --set "$kvantum_theme"


# set the rofi color for background
if [ "$theme_mode" = "Dark" ]; then
    sed -i '/^background:/s/.*/background: rgba(0,0,0,0.7);/' $wallust_rofi
else
    sed -i '/^background:/s/.*/background: rgba(255,255,255,0.9);/' $wallust_rofi
fi

# GTK themes and icons switching
set_custom_gtk_theme() {
    mode=$1
    if [ "$mode" == "Light" ]; then
        search_keywords="*Light*"
        gsettings set $color_setting 'prefer-light'
    elif [ "$mode" == "Dark" ]; then
        search_keywords="*Dark*"
        gsettings set $color_setting 'prefer-dark'
    else
        notify-send -u low -i "$notif" "GTK Theme " " Mode Error"
        return 1
    fi

    while IFS= read -r -d '' theme_search; do
        themes+=("$(basename "$theme_search")")
    done < <(find "$gtk_themes_directory" -maxdepth 1 -type d -iname "$search_keywords" -print0)

    while IFS= read -r -d '' icon_search; do
        icons+=("$(basename "$icon_search")")
    done < <(find "$icon_directory" -maxdepth 1 -type d -iname "$search_keywords" -print0)

    if [ ${#themes[@]} -gt 0 ]; then
        if [ "$mode" == "Dark" ]; then
            selected_theme=${themes[RANDOM % ${#themes[@]}]}
        else
            selected_theme=${themes[$RANDOM % ${#themes[@]}]}
        fi
        gsettings set $theme_setting "$selected_theme"
        # Flatpak GTK apps (themes)
        if command -v flatpak &> /dev/null; then
            flatpak --user override --filesystem=$XDG_DATA_HOME/themes
            sleep 0.5
            flatpak --user override --env=GTK_THEME="$selected_theme"
        fi
    else
        notify-send -u low -i "$notif" "GTK Theme " " No GTK theme found"
    fi

    if [ ${#icons[@]} -gt 0 ]; then
        if [ "$mode" == "Dark" ]; then
            selected_icon=${icons[RANDOM % ${#icons[@]}]}
        else
            selected_icon=${icons[$RANDOM % ${#icons[@]}]}
        fi
        gsettings set $icon_setting "$selected_icon"

        ## QT5ct icon_theme
        sed -i "s|^icon_theme=.*$|icon_theme=$selected_icon|" "$XDG_CONFIG_HOME/qt5ct/qt5ct.conf"
        sed -i "s|^icon_theme=.*$|icon_theme=$selected_icon|" "$XDG_CONFIG_HOME/qt6ct/qt6ct.conf"

        # Flatpak GTK apps (icons)
        if command -v flatpak &> /dev/null; then
            flatpak --user override --filesystem=$XDG_DATA_HOME/icons
            sleep 0.5
            flatpak --user override --env=ICON_THEME="$selected_icon"
        fi
    else
        notify-send -u low -i "$notif" "GTK Theme " " No Icon theme found"
    fi
}

set_custom_gtk_theme "$theme_mode"
echo "$theme_mode" > "$XDG_CACHE_HOME/.theme_mode"
${scripts}/wallust.sh &&

sleep 1
${scripts}/restart_daemon.sh --all

sleep 0.5
notify-send -u low -i "$notif" "Theme:" " $theme_mode Mode"
exit 0
