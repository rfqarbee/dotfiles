return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  enabled = true,
  keys = {
    { "<leader><Esc>", "<cmd>lua require('notify').dismiss()<cr>", "Dismiss Notification" },
  },
  config = function()
    local notify = require("notify")
    vim.notify = notify
    notify.setup({
      render = "minimal",
      fps = 240,
      stages = "slide",
      timeout = 5000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    })
  end,
}
