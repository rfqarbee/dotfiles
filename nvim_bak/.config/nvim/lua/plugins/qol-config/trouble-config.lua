return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/lsp-colors.nvim" },
	config = function()
		local actions = require("telescope.actions")
		local trouble = require("trouble.providers.telescope")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = { ["<C-q>"] = trouble.open_with_trouble },
				},
			},
		})
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = " Go to previous diagnostic" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = " Go to next diagnostic" })
		vim.keymap.set("n", "<leader>tt", function()
			require("trouble").toggle()
		end, { desc = "Toggle trouble" })
		vim.keymap.set("n", "<leader>tw", function()
			require("trouble").toggle("workspace_diagnostics")
		end, { desc = "Workspace diagnostic" })
		vim.keymap.set("n", "<leader>q", function()
			require("trouble").toggle("quickfix")
		end, { desc = "Trouble quickfix" })
		vim.keymap.set("n", "<leader>d", function()
			require("trouble").toggle("document_diagnostics")
		end, { desc = "Document diagnostics" })
		vim.keymap.set("n", "<leader>tl", function()
			require("trouble").toggle("loclist")
		end, { desc = "Loclist" })
		vim.keymap.set("n", "gl", function()
			require("trouble").toggle("lsp_references")
		end, { desc = "Lsp references" })
	end,
}
