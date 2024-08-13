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
      render = "wrapped-compact",
      fps = 60,
      stages = "slide",
      top_down = false,
      timeout = 2500,
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

    local function show_file_info()
      local file_path = vim.fn.expand("%:p"):match("([^/]+)$")
      local modified = vim.bo.modified
      local total_lines = vim.fn.line("$")
      local message = ""

      if file_path == nil then
        return
      else
        if modified then
          message = "[Modified+] File: " .. file_path .. " --" .. total_lines .. " lines"
        else
          message = "File: " .. file_path .. " --" .. total_lines .. " lines"
        end
        notify(message, "info", { title = "File Information", top_down = false })
      end
    end

    vim.keymap.set("n", "<C-g>", function()
      show_file_info()
    end, { desc = "Show current file name" })
  end,
}
