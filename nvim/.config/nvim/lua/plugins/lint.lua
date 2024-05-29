return {
	"mfussenegger/nvim-lint",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			c = { "cpplint" },
		}

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Linting" })
	end,
}
