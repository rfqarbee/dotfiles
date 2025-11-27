# defaults
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export LOCAL_DIR=$HOME/.local
export FREEZE_OUT=$HOME/Pictures/Screenshots
export DEV=$HOME/dev
export REPOS=$HOME/repos
export PROBE=$HOME/probe
export DOTFILES=$HOME/dotfiles
export TMPDIR=/tmp

# wine
export WINEARCH=win64
export MGFXC_WINE_PATH=/home/rafiq/.winemonogame

# profile
export EDITOR=nvim
export VISUAL=nvim
export PAGER='less'
export MANPAGER="nvim +Man!"
export MANWIDTH=200

# misc
export PULSE_COOKIE=$XDG_CONFIG_HOME/pulse/pulse-cookie
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/"
export WWW_HOME="google.com"
export W3M_DIR=$HOME/.cache/w3m

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--bind=ctrl-f:preview-half-page-down,ctrl-b:preview-half-page-up
--ansi
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'

export PROMPT_EOL_MARK=''
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
export ASDF_DATA_DIR=$XDG_CONFIG_HOME/asdf # mise plugin; asdf
export GRIM_DEFAULT_DIR=$HOME/Pictures/Screenshots

