return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "ayu_dark",
			component_separators = { left = "|", right = "|" },
			-- section_separators = { left = "|", right = "|" },
			disabled_filetypes = {
				statusline = { "trouble", "oil" },
			},
		},
		sections = {
			lualine_c = {
				{
					"buffers",
					show_modified_status = true,
					mode = 0,
					filetype_names = {
						-- quickfix = "Quickfix",
						diagnostics = "Diagnostics",
						trouble = "Trouble",
						oil = "Oil nvim",
					},
				},
				{
					"filename",
					path = 4,
					symbols = {
						modified = "<+>",
						readonly = "ReadOnly",
						unnamed = "",
						newfile = "<New>",
					},
				},
			},
		},
		extensions = { "quickfix", "mason" },
	},
}
