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
