# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=5000

setopt hist_ignore_all_dups
setopt autocd beep extendedglob nomatch notify
#zle_highlight=('paste:none')

# source custom file
source $ZDOTDIR/aliases.zsh

# plugins
plug "$ZDOTDIR/plugins/zsh-vi-mode.zsh"
plug "$ZDOTDIR/plugins/should-use.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/zap-prompt"
plug "romkatv/powerlevel10k"
# source "MichaelAquilina/zsh-auto-notify"

