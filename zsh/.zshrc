if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light Aloxaf/fzf-tab # before plugsins wrap widgets

function zvm_config() {
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
}
ZVM_INIT_MODE=sourcing
ZVM_VI_HIGHLIGHT_FOREGROUND=black
ZVM_VI_HIGHLIGHT_BACKGROUND=white
ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold,underline    # bold and underline

zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# Load and initialise completion system
autoload -Uz compinit && compinit
zinit cdreplay -q # reload all completion

bindkey '^n' history-search-forward
bindkey '^p' history-search-backward

ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt autocd notify
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# pnpm
export PNPM_HOME="/home/rafiq/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

source <(fzf --zsh)
eval "$(atuin init zsh)"
eval "$(zoxide init zsh --cmd cd)"
eval "$(mise activate zsh)"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
