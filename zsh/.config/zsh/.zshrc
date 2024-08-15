# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# plugins
zinit light Aloxaf/fzf-tab # before plugsins wrap widgets

source $ZDOTDIR/zsh-vi-mode.zsh # zsh-vi-mode options
zinit ice depth=1 # zsh-vi-mode
zinit light jeffreytse/zsh-vi-mode

zinit light MichaelAquilina/zsh-you-should-use
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# Load and initialise completion system
autoload -Uz compinit && compinit
zinit cdreplay -q # reload all completion

# key binds
bindkey -s "^E" "tmux_session.sh\n"
bindkey -s "^b" "backend.sh\n"
# bindkey -ar "O"
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# set options for history
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase

# options
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space # wont save any input that starts with space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# setopt autocd beep extendedglob nomatch notify

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' menu no # if use fzf-tab
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-f:accept' 'ctrl-o:select'
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' fzf-min-height 100
zstyle ':fzf-tab:complete:*:options' fzf-preview
zstyle ':fzf-tab:complete:*:argument-1' fzf-preview
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN="|/home/rafiq/.local/scripts/lessfilter.sh %s"

source $ZDOTDIR/aliases.zsh

# if fzf is below 0.48.0 (ex : debian)
fzf_ver=$(fzf --version | awk -F '.' '{print $2}') # get the version

# BUG: for opensuse wsl
eval "$(zoxide init zsh --cmd cd)"
# if [[ -n $(command -v fzf) ]] && [[ $fzf_ver -lt 48 ]]; then
#   source /usr/share/doc/fzf/examples/key-bindings.zsh
#   source /usr/share/doc/fzf/examples/completion.zsh
# else
  source <(fzf --zsh)
# fi

eval "$(starship init zsh)"
eval "$(mise activate zsh)"
