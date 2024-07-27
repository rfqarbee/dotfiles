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
    on_open = function(win)
      local view = require("zen-mode.view")
      local layout = view.layout(view.opts)
      vim.api.nvim_win_set_config(win, {
        width = layout.width,
        height = layout.height - 1,
      })
      vim.api.nvim_win_set_config(view.bg_win, {
        width = vim.o.columns,
        height = view.height() - 1,
        row = 1,
        col = layout.col,
        relative = "editor",
      })
    end,
    window = {
      width = 0.90,
      options = {
        showtabline = 2,
      },
    },
    plugins = {
      -- vim.option
      -- options = {
      --   ruler = true,
      --   showcmd = true,
      --   laststatus = 2,
      -- },
      -- TODO:
      twilight = { enabled = false },
      tmux = { enabled = false },
      kitty = {
        enabled = false,
        font = "+1",
      },
      todo = { enabled = false },
    },
  },
}
