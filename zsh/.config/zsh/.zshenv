# needs
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_PROJECT_DIR=$HOME/Dev
export XDG_REPOS_DIR=$HOME/Repos
export XDG_LOCAL_DIR=$HOME/.local
export XDG_DOCUMENTS_DIR=$HOME/Documents
export TMPDIR=/tmp

# path
typeset -U path PATH
path=($HOME/bin $HOME/.local/share/mise/shims $HOME/.local/bin/flutter/bin /usr/local/bin $HOME/.local/bin $HOME/.local/scripts $path)
# cdpath=(. $HOME/Media/Pictures $HOME/.config $HOME/.local $HOME $HOME/code $HOME/Documents) # using zoxide
export PATH

# export local env
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --height=80%'
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export TERMINAL=/usr/bin/kitty
export EDITOR=nvim
export PAGER='less'
export MANPAGER="nvim +Man!"
export MANWIDTH=999

export PULSE_COOKIE=$XDG_CONFIG_HOME/pulse/pulse-cookie
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/"
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export WWW_HOME="google.com"
export W3M_DIR=$HOME/.cache/w3m
export GRIM_DEFAULT_DIR=$HOME/Media/Pictures/screenshot
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv # nvidia

# changing defaults
export MARIADB_HISTFILE=$XDG_CACHE_HOME/mariadb_history # mariadb
export SQLITE_HISTORY=$XDG_CACHE_HOME/sqlite_history # sqlite
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc" # postgres
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"

# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine

# npm
export npm_config_cache="$XDG_CACHE_HOME/npm"

# rust custom path
export CARGO_HOME=$XDG_CONFIG_HOME/cargo
export RUSTUP_HOME=$XDG_CONFIG_HOME/rustup

# go
export GOPATH="$XDG_DATA_HOME"/go

# android
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export FLUTTER_ROOT=$XDG_CONFIG_HOME/flutter
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PUB_CACHE=$XDG_CONFIG_HOME/pub_cache
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin
export ANDROID_USER_HOME=$XDG_CONFIG_HOME/.android/
export ANDROID_AVD_HOME=$XDG_CONFIG_HOME/.android/avd # lancao lu android studio
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java # android studio will yap about this
