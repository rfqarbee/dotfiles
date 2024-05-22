return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = { require("telescope.themes").get_dropdown() },
			},
		})
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Help Keymap" })
		vim.keymap.set("n", "<leader>fs", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>ff", builtin.builtin, { desc = "Find Telescope builtin" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep current word" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find diagnostics" })
		vim.keymap.set("n", "<leader>.", builtin.oldfiles, { desc = "Find recent files" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Active buffers" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "Live grep open files" })

		vim.keymap.set("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "neovim config" })
	end,
}
