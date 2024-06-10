# change to another
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# nvm
checkOS=$(grep -iw "name" /etc/os-release | awk -F '=' '{ gsub("\"","");print $2}')
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.config/nvm"
if [[ -n $checkOS ]] && [[ $checkOS == 'Arch Linux' ]]; then
  [ -s "$NVM_DIR/nvm.sh" ] && source /usr/share/nvm/nvm.sh && source /usr/share/nvm/bash_completion && source /usr/share/nvm/install-nvm-exec
else
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# plugins
zinit light Aloxaf/fzf-tab # before plugsins wrap widgets

# using starship rs
# zinit ice depth"1" # powerlevel10k
# zinit light romkatv/powerlevel10k

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

# run p10k configure
# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# key binds
bindkey -s "^E" "create-tmux-session\n"
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
zstyle ':fzf-tab:*' fzf-min-height 50
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN="|~/.local/scripts/lessfilter.sh %s"

# zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza -1 -lA --color=always  $realpath' # zoxide
# zstyle ':fzf-tab:complete:ls:*' fzf-preview 'eza -1 -lA --color=always $realpath'
#zle_highlight=('paste:none')

source $ZDOTDIR/aliases.zsh

# Configuration

# if fzf is below 0.48.0 (ex : debian)
fzf_ver=$(fzf --version | awk -F '.' '{print $2}') # get the version

eval "$(zoxide init zsh)"
if [[ -n $(command -v fzf) ]] && [[ $fzf_ver -lt 48 ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
else
  source <(fzf --zsh)
fi

eval "$(starship init zsh)"
