if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zap
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# nvm
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source /usr/share/nvm/nvm.sh && source /usr/share/nvm/bash_completion && source /usr/share/nvm/install-nvm-exec

source $ZDOTDIR/zshrc.zsh

# Load and initialise completion system
autoload -Uz compinit
compinit

# load after completions
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
plug "$ZDOTDIR/plugins/syntax-highlighting.zsh"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
