local luasnip = require("luasnip")
local autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

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
		{ name = "nvim_lsp", group_index = 0 },
		{ name = "lazydev", group_index = 1 },
		{ name = "luasnip", group_index = 2 },
		{ name = "path", group_index = 3 },
		-- { name = "luasnip_choice" },
	}, { name = "buffer" }),
})

-- bracket after select function and shit
cmp.event:on("confirm_done", autopairs.on_confirm_done())
