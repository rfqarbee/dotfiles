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
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv # nvidia
export GNUPGHOME=$XDG_DATA_HOME/gnupg

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--ansi
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'
