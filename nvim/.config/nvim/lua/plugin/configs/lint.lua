return {
	"mfussenegger/nvim-lint",
	enabled = true,
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
		lint.linters.cpplint.args = {
			"--filter",
			"-whitespace",
			"-legal/copyright",
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			group = vim.api.nvim_create_augroup("LintGroup", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})

		-- manually call lint
		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Linting" })
	end,
}
