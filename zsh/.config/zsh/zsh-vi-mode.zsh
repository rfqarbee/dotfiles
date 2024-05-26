# zsh-vi-mode
ZVM_INIT_MODE=sourcing
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_LINE_INIT_MODE=$ZVM_MODE_LAST

function custom_widget() {
  echo 'Hello, zsh\n'
}

function zvm_after_lazy_keybindings() {
# zvm_bindkey vicmd '^F' "create-tmux-session\n"
zvm_define_widget custom_widget

zvm_bindkey vicmd '^E' custom_widget
}

# source $XDG_DATA_HOME/zinit/plugins/jeffreytse---zsh-vi-mode/zsh-vi-mode.zsh
