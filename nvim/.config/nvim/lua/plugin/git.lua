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
	{
		event = "BufEnter",
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({
				message_template = "[<author> • <date> • <summary>]",
				display_virtual_text = true,
				virtual_text_column = 80, -- if enable, virtualtxt at 100 column
				-- date_format = "%d/%m/%Y %H:%M%p %r",
				date_format = "%d-%m-%Y %r",
			})
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local neogit = require("neogit")
			neogit.setup({})

			vim.keymap.set("n", "<leader>gp", function()
				neogit.open()
			end, { desc = "Open Neogit" })
			vim.keymap.set("n", "<leader>go", "<cmd>Neogit cwd=%:p:h<cr>", { desc = "Open Neogit" })
		end,
	},
}
