
#plugins
function zvm_config() {
	ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
	ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
	ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
#	ZVM_VI_HIGHLIGHT_FOREGROUND=green
#	ZVM_VI_HIGHLIGHT_BACKGROUND=red
}


source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
