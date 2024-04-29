return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		theme = "dracula",
		sections = {
			lualine_c = {
				{
					"filename",
					path = 3,
				},
			},
		},
	},
}
