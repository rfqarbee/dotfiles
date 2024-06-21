require("neo-tree").setup({
	enable_diagnostics = false,
	close_if_last_window = true,
	window = {
		position = "right",
		width = 45,
	},
	filesystem = {
		follow_current_file = {
			leave_dirs_open = true,
		},
	},
})

vim.keymap.set("n", "<leader>on", "<cmd>Neotree focus<cr>", { desc = "Switch to Tree" })
