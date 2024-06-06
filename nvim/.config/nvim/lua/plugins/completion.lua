return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		{
			"L3MON4D3/LuaSnip",
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
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({})
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			view = {
				entries = {
					name = "custom",
					selection_order = "near_cursor",
					follow_cursor = true,
				},
			},
			completion = { completeopt = "menu,menuone,noinsert" },
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete({}),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-f>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-b>"] = cmp.mapping.scroll_docs(-5),
				["<C-d>"] = cmp.mapping.scroll_docs(5),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "lazydev", group_index = 0 },
				-- { name = "luasnip_choice" },
				{ name = "path" },
				{ name = "buffer" },
			}),
		})
	end,
}
