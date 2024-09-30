# basic
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_DEV_DIR=$HOME/dev
export XDG_REPOS_DIR=$HOME/repos
export XDG_LOCAL_DIR=$HOME/.local
export XDG_DOCUMENTS_DIR=$HOME/Documents
export TMPDIR=/tmp
export FREEZE_OUT=$HOME/Media/Pictures/tui

# path
typeset -U path PATH
path=($HOME/bin $HOME/.config/pub_cache/bin /usr/local/bin $HOME/.local/bin $HOME/.local/scripts $path)
export PATH

## export local env
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'
# export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
export PROMPT_EOL_MARK=''
# export TERMINAL=/usr/bin/kitty
# export TERM=xterm
export TMUX_TMPDIR=/tmp
export EDITOR=nvim
export VISUAL=nvim
export PAGER='less'
export MANPAGER="nvim +Man!"
export MANWIDTH=200
export BROWSER=firefox-developer-edition
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
export ASDF_DATA_DIR=$XDG_CONFIG_HOME/asdf # mise plugin; asdf

export PULSE_COOKIE=$XDG_CONFIG_HOME/pulse/pulse-cookie
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/"
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export WWW_HOME="google.com"
export W3M_DIR=$HOME/.cache/w3m
export GRIM_DEFAULT_DIR=$HOME/Media/Pictures/screenshot
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv # nvidia
export WGETRC=$XDG_CONFIG_HOME/wgetrc
# changing defaults
export MARIADB_HISTFILE=$XDG_CACHE_HOME/mariadb_history # mariadb
export SQLITE_HISTORY=$XDG_CACHE_HOME/sqlite_history # sqlite
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc" # postgres
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"
export TMUX_TMPDIR=/tmp

# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine

# npm
export npm_config_cache="$XDG_CACHE_HOME/npm"
export YARNRC=$XDG_CONFIG_HOME/yarn/.yarnrc
export NODE_REPL_HISTORY=$XDG_CACHE_HOME/node_repl_history

# rust custom path
export CARGO_HOME=$XDG_CONFIG_HOME/cargo
export RUSTUP_HOME=$XDG_CONFIG_HOME/rustup

# go
export GOPATH="$XDG_DATA_HOME"/go

# android
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export PUB_CACHE=$XDG_CONFIG_HOME/pub_cache
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin
export ANDROID_USER_HOME=$XDG_CONFIG_HOME/.android/
export ANDROID_AVD_HOME=$XDG_CONFIG_HOME/.android/avd # lancao lu android studio
