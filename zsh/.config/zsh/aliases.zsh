# alias
alias srz="source ~/.config/zsh/.zshrc"
alias vi=/usr/bin/vim
alias vim="/usr/bin/nvim"
alias tma="tmux attach"
alias tmd="tmux detach"
alias tmk="tmux kill-session -t"
alias tks="tmux kill-server"
alias cd=z
alias ls="eza --color=always"
alias la="eza -lA --group --color=always"
alias l="eza -l --group --color=always"
alias lt="eza --tree -lA --color=always"
# alias lah="eza -lAh --color=always"
alias grep='grep --color=always'
alias egrep='egrep --color=always'
alias fgrep='fgrep --color=always'
alias zgrep='fgrep --color=always'
alias lg=lazygit
alias gs="git status"
alias update="sudo pacman -Syu"
alias pacman="sudo pacman"
alias cat="bat"
alias mv='mv -i'
alias cp='cp -r'
alias rm='rm -i'

# set .yarn in config
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
