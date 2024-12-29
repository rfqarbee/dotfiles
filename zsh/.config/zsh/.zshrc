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
bindkey -s '^f' "freeze -o $FREEZE_OUT/"
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# set options for history
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase

# options
setopt autocd notify
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space # wont save any input that starts with space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

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
has_tmux=$(pgrep tmux)

run_tmux() {
    tmux_session.sh
}

[ $(command -v fzf) ] && source <(fzf --zsh)
[ $(command -v zoxide) ] && eval "$(zoxide init zsh --cmd cd)"
[ $(command -v oh-my-posh) ] && eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/ohmyposh/omposh.toml)"
[ $(command -v mise) ] && eval "$(mise activate zsh)"
# [ $(command -v starship)] && eval "$(starship init zsh)"

if [[ -z $(oh-my-posh notice) ]]; then
[ $(command -v tmux) ] && [[ -z $TMUX ]] && [[ -z $has_tmux ]] && run_tmux
fi
