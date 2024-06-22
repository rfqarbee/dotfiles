local w = require("which-key")

w.register({
	h = "Harpoon",
	["<C-s>"] = "Save file",
	["<C-q>"] = "Quit neovim",
	["<C-x>"] = "Source & execute",
	["-"] = "Oil -> Directory",
	-- f = { name = "Telescope" },
	t = "Telescope",
	q = "Trouble",
	m = "Format",
	l = "Lsp",
	g = "Git",
}, { prefix = "<leader>" })
