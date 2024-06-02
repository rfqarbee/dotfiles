return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = {
				"icon",
				"size",
			},
			view_options = {
				show_hidden = true,
			},
			float = {
				border = "rounded",
				win_options = {
					winblend = 0,
				},
			},
			use_default_keymaps = false,
			-- delete_to_trash = true,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-w>s"] = "actions.select_vsplit",
				["<C-w>t"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<space>r"] = "actions.refresh", -- refresh list
				["<Tab>"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd", -- change project directory
				["~"] = "actions.tcd", -- change current tab directory
				["gs"] = "actions.change_sort",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
		})

		vim.keymap.set("n", "-", require("oil").toggle_float, { desc = "Oil Float" })
		vim.keymap.set("n", "<leader>-", require("oil").open)
	end,
}
