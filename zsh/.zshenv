export HISTFILE=$HOME/.config/zsh/.histfile
export WINEARCH=win64
export GUM_WINE_PREFIX_PATH=$HOME/.wine_gum_prefix
export MGFXC_WINE_PATH=$HOME/.winemonogame
export GOPATH=$XDG_DATA_HOME/go
export PNPM_HOME="/home/rafiq/.local/share/pnpm"
# .NET
export DOTNET_TELEMETRY_OPTOUT=1
export XDG_MENU_PREFIX="arch- kbuildsycoca6 --noincremental"

typeset -U path PATH
path=(
  /usr/local/bin
  $HOME/.local/bin
  $HOME/.local/scripts
  $HOME/.dotnet/tools
  $HOME/.local/share/go/bin
  $HOME/.cargo/bin
  $PNPM_HOME/bin
  $path)
export PATH

