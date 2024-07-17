-- plugins with simple configuration
return {
  { "vidocqh/auto-indent.nvim", opts = {} },
  -- tpope W
  { "tpope/vim-sleuth" },
  -- nui
  {
    "MunifTanjim/nui.nvim",
  },
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
  },
  -- undotree
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Undo Tree" },
    },
    config = function()
      local tree = require("undotree")

    end,
  },
}
