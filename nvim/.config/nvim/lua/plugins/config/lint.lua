return {
  "mfussenegger/nvim-lint",
  enabled = false,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = { "eslint_d", "eslint" },
      typescript = { "eslint_d", "eslint" },
      typescriptreact = { "eslint_d", "eslint" },
      javascriptreact = { "eslint_d", "eslint" },
      svelte = { "eslint_d", "eslint" },
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

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Linting" })
  end,
}
