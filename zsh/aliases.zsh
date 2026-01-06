# alias
alias srz="source ~/.config/zsh/.zshrc"
alias vi="/usr/bin/vim"
alias vim="/usr/bin/nvim"
alias tma="tmux attach"
alias tks="tmux kill-server"
alias ls="eza --color=always"
alias l="eza -lA --group --color=always"
alias lt="eza --tree -lA --color=always --icons=always"
alias grep='grep --color=always'
alias egrep='egrep --color=always'
alias fgrep='fgrep --color=always'
alias zgrep='fgrep --color=always'
alias cat="bat"
alias catt="/usr/bin/cat"

function vimssh() {
  nvim oil-ssh://$1
}

