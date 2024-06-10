return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "notesidian",
				path = "~/Documents/notesidian",
			},
			-- {
			-- 	name = "work",
			-- 	path = "~/Documents/notesidian/work",
			-- },
		},

		-- see below for full list of options 👇
	},
}
