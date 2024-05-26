#PATH for ZSH
typeset -U path PATH
path=($HOME/bin /usr/local/bin $HOME/.local/bin $HOME/.local/scripts $path)
# cdpath=(. $HOME/Media/Pictures $HOME/.config $HOME/.local $HOME $HOME/code $HOME/Documents)
export PATH
## asdf
. "$HOME/.config/asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)

export EDITOR=nvim
# asdf
export ASDF_DATA_DIR=$HOME/.config/asdf
# xdg
export XDG_PICTURES_DIR=$HOME/Media/Pictures/
export XDG_BIN_HOME=$HOME/.local/bin
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_LOCAL_HOME=$HOME/.local
export XDG_WORK_DIR=$HOME/code
export XDG_REPOS_DIR=$HOME/repos
export XDG_DOCUMENTS_DIR=$HOME/Documents
export XDG_DOWNLOAD_DIR=$HOME/Downloads
export TMPDIR=/tmp/
# npm
export npm_config_cache="$HOME/.cache/npm"
# rust custom path
export CARGO_HOME=$HOME/.config/cargo
export RUSTUP_HOME=$HOME/.config/rustup
# misc configuration
# export hist file
export MARIADB_HISTFILE=$HOME/.cache/mariadb_history
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
export ASDF_PROTONGE_STEAM_COMPAT_DIR=~/.steam/steam/compatibilitytools.d/
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export TERMINAL=/usr/bin/kitty
export GTK2_RC_FILES="$HOME/.config/gtk-2.0"
export MANPAGER="nvim +Man!"
export MANWIDTH=999
export GRIM_DEFAULT_DIR=$HOME/Media/Pictures/screenshot
export FFMPEG_DATADIR="$XDG_CONFIG_HOME"/ffmpeg
export GNUPGHOME=$HOME/.local/share/gnupg
export W3M_DIR=$HOME/.cache/w3m
export WWW_HOME="google.com"

# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --height=60%
#   --color=fg:#eae7e7,fg+:#70da64,bg:#121212,bg+:#262626
#   --color=hl:#5d8fc0,hl+:#5efff2,info:#b0a787,marker:#87ff00
#   --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#9db3cc
#   --color=border:#262626,label:#aeaeae,query:#d9d9d9
#   --border="thinblock" --border-label="" --preview-window="border-bold" --prompt=">>"
#   --marker=">" --pointer="◆" --separator="─" --scrollbar="│"
#   --info="right"'
