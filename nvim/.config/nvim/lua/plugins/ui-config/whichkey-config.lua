return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		local w = require("which-key")
		w.register({
			["<space>"] = "File Explore",
			s = { name = "Telescope" },
			u = { name = "Undotree" },
			t = {
				name = "Trouble",
				t = "Toggle Buffer",
				w = "Workspace Diagnostics",
				q = "Quickfix",
				d = "Document Diagnostics",
				l = "Loclist",
			},
			d = {
				name = "Lsp",
				s = "D[D]ocument [S]ymbols",
			},
			r = {
				name = "Lsp",
				n = "[R]e[N]ame",
			},
			c = {
				name = "Lsp",
				a = " [C]ode [A]ction",
			},
			q = {
				"Quit Neovim",
			},
			-- l = {
			-- 	name = "Lsp :",
			-- 	n = "Rename Buffer",
			-- 	w = "Workspace Folder",
			-- 	a = "Workspace Add",
			-- 	r = "Workspace Remove",
			-- 	l = "Workspace List",
			-- 	d = "Type Definition",
			-- 	c = "Code action",
			-- },
			-- w = "Window",
		}, { prefix = "<leader>" })
	end,
}
