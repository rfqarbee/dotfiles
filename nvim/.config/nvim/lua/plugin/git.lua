return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged_enable = true,
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 200,
					ignore_whitespace = false,
					virt_text_priority = 100,
				},
				current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
			})
		end,
	},
	-- {
	-- 	event = "BufEnter",
	-- 	"f-person/git-blame.nvim",
	-- 	config = function()
	-- 		require("gitblame").setup({
	-- 			message_template = "[<author> • <date> • <summary>]",
	-- 			display_virtual_text = true,
	-- 			virtual_text_column = 80, -- if enable, virtualtxt at 100 column
	-- 			-- date_format = "%d/%m/%Y %H:%M%p %r",
	-- 			date_format = "%d-%m-%Y %r",
	-- 		})
	-- 	end,
	-- },
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
