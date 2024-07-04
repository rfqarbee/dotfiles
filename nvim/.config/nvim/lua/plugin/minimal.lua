return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "ayu_dark",
				component_separators = { left = " ", right = "" },
				-- section_separators = { left = "|", right = "|" },
				disabled_filetypes = {
					statusline = { "trouble", "oil" },
				},
			},
			sections = {
				lualine_c = {
					{
						"filename",
						path = 4,
						symbols = {
							modified = "<+>",
							readonly = "<ReadOnly>",
							unnamed = "",
							newfile = "<New>",
						},
					},
				},
			},
			extensions = { "quickfix", "mason" },
		},
	},
	{
		"crispgm/nvim-tabline",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional
		config = function()
			require("tabline").setup({
				show_index = false,
				show_modify = false,
				show_icon = true,
				no_name = "Unnamed", -- no name buffer name
				brackets = { "", "" }, -- file name brackets surrounding
				inactive_tab_max_length = 0, -- max length of inactive tab titles, 0 to ignore
			})
		end,
	},
}
