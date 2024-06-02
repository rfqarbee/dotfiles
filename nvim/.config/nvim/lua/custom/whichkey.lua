local w = require("which-key")

w.register({
	["<space>"] = "Harpoon",
	["<C-s>"] = "Save file",
	["<C-q>"] = "Quit neovim",
	["<C-x>"] = "Source & execute",
	["-"] = "Directory (Float)",
	f = { name = "Telescope" },
	u = "Undotree",
	t = {
		name = "Trouble buffer",
	},
	q = "Quickfix",
	m = {
		name = "Format",
	},
	l = {
		name ="Trouble"
	},
	g = {
		name = "Commands",
	},
	c = "Lsp",
	n = "Neovim config"
}, { prefix = "<leader>" })
