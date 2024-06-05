return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang_format" },
				typescript = { "prettier" },
				javascript = {
					"prettier",
				},
			},
		})
		-- 		c = { "clang_format" },
		-- 		typescript = { { "prettierd", "prettier" } },
		-- 		javascript = { { "prettierd", "prettier" } },
		-- 		typescriptreact = { { "prettierd", "prettier" } },
		-- 		svelte = { { "prettierd", "prettier" } },
		-- 		css = { { "prettierd", "prettier" } },
		-- 		html = { "prettier" },
		-- 		json = { "prettier" },
		-- 		yaml = { "prettier" },
		-- 		markdown = { "prettier" },
		-- 		graphql = { "prettier" },
		-- 		lua = { "stylua" },

		vim.api.nvim_create_autocmd("BufWritePre", {
			desc = "Conform format",
			group = vim.api.nvim_create_augroup("Autoformat", { clear = true }),
			callback = function(event)
				require("conform").format({
					bufnr = event.buf,
					lsp_fallback = true,
					quiet = true,
				})
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format Code" })
	end,
}
