# alias file
alias srz="source ~/.config/zsh/.zshrc"
alias vim=nvim
alias nvimrc='nvim ~/.config/nvim'
alias note="nvim ~/Documents/notesidian/"
alias tma="tmux attach"
alias tmd="tmux detach"
alias tmk="tmux kill-session -t"
alias tks="tmux kill-server"

# colorize output
alias cd="z"
alias ls="ls --color=auto"
alias la="ls -A --color=auto"
alias ll="ls -lA --color=auto"
alias lah="ls -lAh --color=auto"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias zgrep='fgrep --color=auto'
alias lg="lazygit"
alias gs="git status"
alias update="sudo pacman -Syu"
alias pacman="sudo pacman"
alias cat="bat"

# confirm before overwriting
alias mv='mv -i'
alias cp='cp -r'
alias rm='rm -i'
