-- still testing

return {
  "stevearc/aerial.nvim",
  enabled = false,
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup({
      layout = {
        max_width = { 40, 0.2 },
        min_width = 25,
      },
      -- default_direction = "left",
      on_attach = function(bufnr)
        vim.keymap.set("n", "[a", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "]a", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    })
    -- You probably also want to set a keymap to toggle aerial
    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle left<CR>")
  end,
}
