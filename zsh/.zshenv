# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
export MISE_DEFAULT_CONFIG_FILENAME=".mise.local.toml"
export BROWSER=zen-browser
# go
export GOPATH=$XDG_DATA_HOME/go
# .NET
export DOTNET_ROOT=$XDG_DATA_HOME/mise/installs/dotnet/latest # remove if not using mise
export DOTNET_TELEMETRY_OPTOUT=1
export XDG_MENU_PREFIX="arch- kbuildsycoca6 --noincremental"
# path
typeset -U path PATH
path=($HOME/bin $HOME/.config/pub_cache/bin /usr/local/bin $HOME/.local/bin $HOME/.local/scripts $DOTNET_ROOT $DOTNET_ROOT/tools $HOME/.local/share/go/bin $HOME/.cargo/bin $HOME/.dotnet/tools $HOME/repos/kraken-desktop $path)
export PATH

