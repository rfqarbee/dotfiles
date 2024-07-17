-- plugins with simple configuration
return {
  { "vidocqh/auto-indent.nvim", opts = {} },
  -- tpope W
  { "tpope/vim-sleuth" },

  -- nvim colorizer (nvchad fork)
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({})
    end,
  },
  -- i like this
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        title_pos = "center",
      },
    },
  },
  -- undotree
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Undo Tree" },
    },
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_DiffpanelHeight = 15
    end,
  },
}
