local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<M-e>"] = actions.close,
				["<C-h>"] = "which_key",
				["<C-u>"] = false,
				["<C-p>"] = actions.move_selection_previous,
				["<C-n>"] = actions.move_selection_next,
				["<C-k>"] = actions.preview_scrolling_up,
				["<C-j>"] = actions.preview_scrolling_down,
			},
		},
		winblend = 0,
		initial_mode = "insert",
	},
	extensions = {
		["ui-select"] = { require("telescope.themes").get_dropdown() },
	},
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

vim.keymap.set("n", "<M-e>", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<M-w>", builtin.grep_string, { desc = "Grep current word" })
vim.keymap.set("n", "<M-f>", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>i", builtin.commands, { desc = "Help tags" })
vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Help Keymap" })
vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "Find Telescope builtin" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Active buffers" })
vim.keymap.set("n", "<leader>.", builtin.oldfiles, { desc = "Find recent files" })

vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({ winblend = 5, previewer = false }))
end, { desc = "Search current buffer" })

vim.keymap.set("n", "<leader>fo", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "Live grep open files" })

vim.keymap.set("n", "<leader>nc", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Neovim config" })
