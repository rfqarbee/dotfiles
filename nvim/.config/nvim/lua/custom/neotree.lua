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

-- BUG: open tree
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*.md",
	callback = function()
		vim.cmd([[Neotree show]])
	end,
})

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "neo-tree",
-- 	callback = function()
-- 		-- local buf = vim.api.nvim_get_current_buf()
-- 		-- vim.api.nvim_set_option_value("bufhidden", "wipe", tonumber(buf))
-- 		-- vim.bo.readonly = false
-- 	end,
-- })
