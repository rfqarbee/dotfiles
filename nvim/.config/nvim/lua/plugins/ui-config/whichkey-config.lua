return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		local w = require("which-key")
		w.register({
			["<space>"] = "File Explore",
			f = { name = "Telescope" },
			u = { name = "Undotree" },
			t = {
				name = "Trouble buffer",
			},
			q = "Quickfix",
			g = {
				name = "Commands",
			},
			r = {
				name = "Lsp",
				n = "rename",
			},
			c = {
				name = "Lsp",
				a = "code action",
			},
		}, { prefix = "<leader>" })
	end,
}
