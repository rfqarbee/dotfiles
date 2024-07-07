-- still testing

return {
  "stevearc/aerial.nvim",
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup({
      on_attach = function(bufnr)
        vim.keymap.set("n", "[a", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "]a", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    })
    -- You probably also want to set a keymap to toggle aerial
    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle left<CR>")
  end,
}
