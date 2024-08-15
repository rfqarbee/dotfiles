return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },
  { "tpope/vim-sleuth" },
  {
    "NvChad/nvim-colorizer.lua",
    keys = {
      { "<leader>ch", "<cmd>ColorizerToggle<cr>", "show color" },
    },
    config = function()
      require("colorizer").setup({})
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      -- input = {
      --   title_pos = "left",
      -- },
      input = {
        get_config = function(opts)
          print(vim.inspect(opts))
          if opts.kind == nil then
            return {
              relative = "editor",
              title_pos = "left",
            }
          end
        end,
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
