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

export BROWSER="vivaldi"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export MANPAGER="nvim +Man!"
export MANWIDTH=200
export PROMPT_EOL_MARK=""
export GRIM_DEFAULT_DIR="$HOME/Pictures/Screenshots"

export PULSE_COOKIE="$XDG_CONFIG_HOME/pulse/pulse-cookie"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--bind=ctrl-f:preview-half-page-down,ctrl-b:preview-half-page-up
--ansi
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'

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
