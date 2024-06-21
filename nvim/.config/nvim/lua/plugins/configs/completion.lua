return {
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		priority = 1000,
		-- event = {"InsertEnter","CmdlineEnter"},
		dependencies = {
			"onsails/lspkind.nvim", -- completion icons
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
				build = (function()
					if vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("custom.completion")
		end,
	},
}
