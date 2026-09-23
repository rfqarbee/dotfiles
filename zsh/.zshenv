export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_MENU_PREFIX="arch- kbuildsycoca6 --noincremental"

export TMPDIR="/tmp"
export DEV="$HOME/programming/dev"
export REPO="$HOME/programming/repo"
export PROBE="$HOME/programming/probe"
export WORK="$HOME/programming/work"
export DOTFILES="$HOME/dotfiles"

export GOPATH="$XDG_DATA_HOME/go"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export ASDF_DATA_DIR="$XDG_CONFIG_HOME/asdf"
export HISTFILE="$XDG_CONFIG_HOME/zsh/.histfile"
export WINEARCH="win64"
export GUM_WINE_PREFIX_PATH="$HOME/.wine_gum_prefix"
export MGFXC_WINE_PATH="$HOME/.winemonogame"
export DOTNET_TELEMETRY_OPTOUT=1
export MISE_DEFAULT_CONFIG_FILENAME=".mise.local.toml"
export GIT_EDITOR=/usr/bin/nvim

typeset -U path PATH
path=(
  /usr/local/bin
  $HOME/.local/bin
  $HOME/.local/share/scripts
  $HOME/.dotnet/tools
  $GOPATH/bin
  $HOME/.cargo/bin
  $PNPM_HOME
  $path
)
export PATH
