-- typescript specific
return {
  "pmizio/typescript-tools.nvim",
  ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require("typescript-tools").setup({
      settings = {
        publish_diagnostic_on = "insert_leave",
      },
    })
    local LspAttach = vim.api.nvim_create_augroup("LspAttach", { clear = true })

    -- vim.api.nvim_create_autocmd("LspAttach", {
    --   group = LspAttach,
    --   pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
    --   callback = function()
    vim.keymap.set("n", "<leader>li", function()
      vim.notify("Organizing imports")
      vim.cmd("TSToolsOrganizeImports")
    end, { desc = "Remove unused and organize imports" })
    --   end,
    -- })

    -- vim.api.nvim_create_autocmd("LspAttach", {
    --   group = LspAttach,
    --   pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
    --   callback = function()
    vim.keymap.set("n", "<leader>la", function()
      vim.notify("Adding missing import")
      vim.cmd("TSToolsAddMissingImports")
    end, { desc = "Add missing imports" })
    -- end,
    -- })
  end,
}
