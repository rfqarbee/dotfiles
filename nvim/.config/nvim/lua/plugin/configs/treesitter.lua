return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"c_sharp",
				"cmake",
				"css",
				"dart",
				"dockerfile",
				"gitignore",
				"go",
				"http",
				"json5",
				"json",
				"luadoc",
				"make",
				"regex",
				"sql",
				"svelte",
				"xml",
				"yaml",
				"toml",
				"lua",
				"vim",
				"vimdoc",
				"markdown_inline",
				"markdown",
				"html",
				"tsx",
				"rust",
				"typescript",
			},
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn", -- set to `false` to disable one of the mappings
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		})
	end,
}
