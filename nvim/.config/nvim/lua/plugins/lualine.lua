return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		theme = "dracula",
		sections = {
			lualine_c = {
				{
					"buffers",
					show_modified_status = true,
					mode = 4,
				},
				{
					"filename",
					path = 4,
					symbols = {
						modified = "[+]",
						readonly = "[-]",
						unnamed = "[No Name]",
						newfile = "[New]",
					},
				},
			},
		},
	},
}
