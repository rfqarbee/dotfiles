export WINEARCH=win64
export GUM_WINE_PREFIX_PATH=$HOME/.wine_gum_prefix
export MGFXC_WINE_PATH=$HOME/.winemonogame
# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
# java
# export JAVA_HOME=$HOME/.local/share/mise/shims/java
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_USER_HOME=$HOME/.android
export FLUTTER=$HOME/repo/flutter/bin
# go
export GOPATH=$XDG_DATA_HOME/go
# .NET
export DOTNET_TELEMETRY_OPTOUT=1
export XDG_MENU_PREFIX="arch- kbuildsycoca6 --noincremental"

typeset -U path PATH
path=(
  $HOME/bin
  $HOME/.config/pub_cache/bin
  /usr/local/bin
  $HOME/.local/bin
  $HOME/.local/scripts
  $HOME/.dotnet/tools
  $HOME/.local/share/go/bin
  $HOME/.cargo/bin
  $ANDROID_HOME/tools
  $ANDROID_HOME/tools/bin
  $ANDROID_HOME/platform-tools
  $FLUTTER
  $path)
export PATH

