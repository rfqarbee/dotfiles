-- neotree only in notes
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	Event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cond = function()
		if vim.fn.getcwd() == "/home/rafiq/Documents/notesidian" then
			return true
		end
	end,
	config = function()
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
		-- -- open tree
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*.md",
			callback = function()
				vim.cmd([[Neotree show]])
			end,
		})
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local neotree = vim.bo.filetype
				if neotree == "neo-tree" then
					local buf = vim.api.nvim_get_current_buf()
					vim.api.nvim_set_option_value("bufhidden", "wipe", tonumber(buf))
					print("test its in neo tere")
					vim.opt.number = false
					vim.opt.relativenumber = false
					vim.bo.readonly = true
					vim.bo.modifiable = false
				end
			end,
		})
	end,
}
