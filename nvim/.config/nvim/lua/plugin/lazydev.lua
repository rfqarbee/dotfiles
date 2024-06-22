return {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	opts = {
		library = {
			"lazy.nvim",
			{ plugins = { "nvim-dap-ui" }, types = true },
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
		},
		enabled = function(root_dir)
			return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
		end,
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
}
