return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{ "f-person/git-blame.nvim" },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = function()
			local neogit = require("neogit")
			neogit.setup({})

			vim.keymap.set("n", "<leader>go", function()
				neogit.open()
			end, { desc = "Open Neogit" })
		end,
	},
}
