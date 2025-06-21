# changing defaults
# export MARIADB_HISTFILE=$XDG_CACHE_HOME/mariadb_history
# export SQLITE_HISTORY=$XDG_CACHE_HOME/sqlite_history
# export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc" # postgres
# export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
# export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
# export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"

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

# ts
export NODE_OPTIONS="--max-old-space-size=4096"

# android
# export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
# export PUB_CACHE=$XDG_CONFIG_HOME/pub_cache
# export ANDROID_HOME=/opt/android-sdk
# export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin
# export ANDROID_USER_HOME=$XDG_CONFIG_HOME/.android/
# export ANDROID_AVD_HOME=$XDG_CONFIG_HOME/.android/avd # lancao lu android studio

# .NET
export DOTNET_ROOT=$XDG_DATA_HOME/mise/installs/dotnet/latest # remove if not using mise
export DOTNET_TELEMETRY_OPTOUT=1

# path
typeset -U path PATH
path=($HOME/bin $HOME/.config/pub_cache/bin /usr/local/bin $HOME/.local/bin $HOME/.local/scripts $DOTNET_ROOT $DOTNET_ROOT/tools $HOME/.local/share/go/bin $path)
export PATH

