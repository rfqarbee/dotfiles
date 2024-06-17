#PATH for ZSH
typeset -U path PATH
path=($HOME/bin $HOME/.local/bin/flutter/bin /usr/local/bin $HOME/.local/bin $HOME/.local/scripts $path)
# cdpath=(. $HOME/Media/Pictures $HOME/.config $HOME/.local $HOME $HOME/code $HOME/Documents)
export PATH

# starship
export EDITOR=nvim
export PAGER='less'
export TERMINAL=/usr/bin/kitty

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export SDKMAN_DIR="$HOME/.local/bin/sdkman"
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_USER_HOME=$HOME/.config/.android
export ANDROID_AVD_HOME=$HOME/.config/.android/avd # lancao lu android studio
export PUB_CACHE=$HOME/.config/pub_cache

# export dir path
export XDG_PICTURES_DIR=$HOME/Media/Pictures/
export XDG_BIN_HOME=$HOME/.local/bin
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_LOCAL_HOME=$HOME/.local
export XDG_WORK_DIR=$HOME/Dev
export XDG_REPOS_DIR=$HOME/Repos
export XDG_DOCUMENTS_DIR=$HOME/Documents
export XDG_DOWNLOAD_DIR=$HOME/Downloads
export FFMPEG_DATADIR="$XDG_CONFIG_HOME"/ffmpeg
export GRIM_DEFAULT_DIR=$HOME/Media/Pictures/screenshot
export GNUPGHOME=$HOME/.local/share/gnupg
export W3M_DIR=$HOME/.cache/w3m
export TMPDIR=/tmp/
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

# npm
export npm_config_cache="$HOME/.cache/npm"
# rust custom path
export CARGO_HOME=$HOME/.config/cargo
export RUSTUP_HOME=$HOME/.config/rustup

# misc configuration
export GTK2_RC_FILES="$HOME/.config/gtk-2.0"
export MARIADB_HISTFILE=$HOME/.cache/mariadb_history
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
export MANPAGER="nvim +Man!"
export MANWIDTH=999
export WWW_HOME="google.com"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
   --height=60%'
