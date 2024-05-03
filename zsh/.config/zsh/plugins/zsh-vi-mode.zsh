function zvm_config() {
    ZVM_LINE_INIT_MODE=$ZVM_MODE_LAST
    ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
    ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
    ZVM_INIT_MODE=sourcing

}

function zvm_after_init() {
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
}

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
