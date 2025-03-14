# zsh-vi-mode
ZVM_INIT_MODE=sourcing
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

# highlights
ZVM_VI_HIGHLIGHT_FOREGROUND=black
ZVM_VI_HIGHLIGHT_BACKGROUND=white
ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold,underline    # bold and underline

function create_tmux() {
  tmux-session.sh
}

function zvm_after_lazy_keybindings() {
zvm_define_widget create_tmux

zvm_bindkey vicmd '^E' create_tmux
# zvm_bindkey viins '^E' create_tmux
}
