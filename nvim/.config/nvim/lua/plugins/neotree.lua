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
		})

		vim.keymap.set("n", "<leader>ot", "<cmd>Neotree toggle<cr>", { desc = "Notes File tree" })
		-- -- open tree
		-- vim.api.nvim_create_autocmd("VimEnter", {
		-- 	callback = function()
		-- 		local filetype = vim.bo.filetype
		--
		-- 		if filetype == "neo-tree" then
		-- 			vim.opt.number = false
		-- 			vim.opt.relativenumber = false
		-- 		end
		-- 		vim.cmd([[Neotree show]])
		-- 	end,
		-- })
	end,
}
