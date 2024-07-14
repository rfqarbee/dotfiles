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

    vim.keymap.set("n", "<leader>li", function()
      vim.notify("Organizing imports")
      vim.cmd("TSToolsOrganizeImports")
    end, { desc = "Remove unused and organize imports" })

    vim.keymap.set("n", "<leader>la", function()
      vim.notify("Adding missing import")
      vim.cmd("TSToolsAddMissingImports")
    end, { desc = "Add missing imports" })
  end,
}
