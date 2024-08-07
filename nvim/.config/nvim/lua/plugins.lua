return {
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      disable_filetypes = { "qf", "lazy", "oil", "telescope", "help" },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },
  { "tpope/vim-sleuth" },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({})
    end,
  },
  {
    "stevearc/dressing.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = {
      input = {
        title_pos = "left",
      },
    },
  },
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
