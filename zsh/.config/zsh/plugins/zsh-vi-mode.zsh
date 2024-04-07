function zvm_config() {
    ZVM_LINE_INIT_MODE=$ZVM_MODE_LAST
    ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
    ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK

}

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
