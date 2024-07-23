return {
  "folke/zen-mode.nvim",
  -- dependencies = {
  --   {
  --     "folke/twilight.nvim",
  --     keys = {
  --       { "<leader>wt", "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
  --     },
  --     opts = {},
  --   },
  -- },
  keys = {
    { "<leader>wm", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
  },
  opts = {
    window = {
      width = 0.85,
    },
    plugins = {
      -- vim.option
      -- options = {
      --   ruler = true,
      --   showcmd = true,
      --   laststatus = 2,
      -- },
      twilight = { enabled = false },
      tmux = { enabled = true },
      kitty = {
        enabled = true,
        font = "+1",
      },
      todo = { enabled = true },
    },
  },
}
