return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = {
				"icon",
				"size",
				-- "permissions",
				-- "mtime",
			},
			-- delete_to_trash = true,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-w>s"] = "actions.select_vsplit", -- i like this
				["<C-w>t"] = "actions.select_tab", -- not sure if i like this
				["<C-p>"] = "actions.preview", -- i like this
				["<C-c>"] = "actions.close", -- i like this
				["<space>r"] = "actions.refresh", -- refresh list
				["<Tab>"] = "actions.parent", --not sure if i like the default binds
				["_"] = "actions.open_cwd", -- same as above
				-- change project directory
				["`"] = "actions.cd", -- i like very much
				-- change current tab directory
				["~"] = "actions.tcd", -- meh ok i guess
				["gs"] = "actions.change_sort", -- its whatevs
				["g."] = "actions.toggle_hidden", -- its aight
				["g\\"] = "actions.toggle_trash", -- not sure
			},
			view_options = {
				show_hidden = true,
			},
			use_default_keymaps = false,
		})

		vim.keymap.set("n", "-", require("oil").toggle_float, { desc = "Oil Float" })
		vim.keymap.set("n", "<leader>-", require("oil").open)
	end,
}
