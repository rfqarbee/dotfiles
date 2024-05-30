local w = require("which-key")

w.register({
	["<space>"] = "Harpoon",
	["<C-s>"] = "Save file",
	["<C-q>"] = "Quit neovim",
	["-"] = "Directory (Float)",
	f = { name = "Telescope" },
	u = "Undotree",
	t = {
		name = "Trouble buffer",
	},
	q = "Quickfix",
	g = {
		name = "Commands",
	},
	c = "Lsp",
}, { prefix = "<leader>" })
