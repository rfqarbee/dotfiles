local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local open_trouble = require("trouble.sources.telescope").open

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<M-e>"] = actions.close,
				["<M-d>"] = actions.close,
				["<M-g>"] = actions.close,
				["<M-w>"] = actions.close,
				["<C-h>"] = "which_key",
				["<C-u>"] = false,
				["<C-p>"] = actions.move_selection_previous,
				["<C-n>"] = actions.move_selection_next,
				["<C-k>"] = actions.preview_scrolling_up,
				["<C-j>"] = actions.preview_scrolling_down,
				["<C-t>"] = open_trouble,
			},
			n = {
				["<C-t>"] = open_trouble,
				["<M-e>"] = actions.close,
			},
		},
		winblend = 0,
		initial_mode = "insert",
	},
	extensions = {
		["ui-select"] = { require("telescope.themes").get_dropdown() },
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		undo = {
			initial_mode = "normal",
			mappings = {
				i = {
					["<cr>"] = require("telescope-undo.actions").yank_additions,
					["<C-y>"] = require("telescope-undo.actions").yank_deletions,
					["<C-f>"] = require("telescope-undo.actions").restore,
				},
				n = {
					["y"] = require("telescope-undo.actions").yank_additions,
					["d"] = require("telescope-undo.actions").yank_deletions,
					["<cr>"] = require("telescope-undo.actions").restore,
				},
			},
			side_by_side = true,
			layout_strategy = "horizontal",
			layout_config = {
				preview_height = 0.8,
			},
		},
	},
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
pcall(require("telescope").load_extension, "undo")

vim.keymap.set("n", "<M-e>", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<M-w>", builtin.grep_string, { desc = "Grep current word" })
vim.keymap.set("n", "<M-g>", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<M-d>", function()
	builtin.find_files({ find_command = { "fd", "--type", "d" } })
end, { desc = "Find Directories" })
vim.keymap.set("n", "<leader>ti", builtin.commands, { desc = "Help tags" })
vim.keymap.set("n", "<leader>h", "<cmd>tabnew | Telescope help_tags<cr>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "Active buffers" })
vim.keymap.set("n", "<leader>.", builtin.oldfiles, { desc = "Find recent files" })
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Undotree" })

vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({ winblend = 5, previewer = false }))
end, { desc = "Search current buffer" })

vim.keymap.set("n", "<leader>to", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "Live grep open files" })

-- goto neovim config
vim.keymap.set("n", "<leader>tc", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Neovim config" })

vim.keymap.set("n", "<leader>tn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config_dirs") })
end, { desc = "Neovim config" })

-- goto obsidian vault
-- vim.keymap.set("n", "<leader>on", function()
-- 	builtin.find_files({ cwd = vim.fn.stdpath("log") })
-- end, { desc = "Neovim config" })
