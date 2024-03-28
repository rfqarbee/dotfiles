# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=5000

setopt autocd beep extendedglob nomatch notify
#zle_highlight=('paste:none')

zstyle :compinstall filename '/home/rafiq/.config/zsh/.zshrc'
autoload -Uz compinit
compinit

# source custom file
#plug $ZDOTDIR/ohmyzsh.zsh
plug $ZDOTDIR/aliases.zsh

# Plugins
plug "$ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.zsh"
plug "$ZDOTDIR/plugins/zsh-you-should-use/zsh-you-should-use.zsh"
plug "$ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme"
plug "$ZDOTDIR/plugins/zsh-autosuggestions"
plug "$ZDOTDIR/plugins/zsh-syntax-highlighting"
#plug "MichaelAquilina/zsh-auto-notify"
eval "$(fzf --zsh)"

