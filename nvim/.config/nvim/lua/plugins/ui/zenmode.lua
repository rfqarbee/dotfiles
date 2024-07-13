return {
  "folke/zen-mode.nvim",
  dependencies = {
    "folke/twilight.nvim",
  },
  keys = {
    { "<leader>zm", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
  },
  opts = {
    window = {
      width = 0.80,
    },
    plugins = {
      tmux = { enabled = true },
      kitty = {
        enabled = true,
        font = "+2",
      },
      todo = { enabled = true },
    },
  },
}
