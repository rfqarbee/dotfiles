local w = require("which-key")

w.register({
	["<space>"] = "File Explore",
	["<M-e>"] = "Find files (Telescope)",
	["<C-q>"] = "Quit Buffer",
	["<C-s>"] = "Save and Write",
	f = { name = "Telescope" },
	u = { name = "Undotree" },
	t = {
		name = "Trouble buffer",
	},
	q = "Quickfix",
	g = {
		name = "Commands",
	},
	c = {
		name = "Lsp",
	},
}, { prefix = "<leader>" })
