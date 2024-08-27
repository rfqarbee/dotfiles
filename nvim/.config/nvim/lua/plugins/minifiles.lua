return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    local map = require("utils.mapkey")
    local mini = require("mini.files")
    mini.setup({
      -- content = {
      --   -- Predicate for which file system entries to show
      --   filter = nil,
      --   -- What prefix to show to the left of file system entry
      --   prefix = nil,
      --   -- In which order to show file system entries
      --   sort = nil,
      -- },
      -- Module mappings created only inside explorer.
      -- Use `''` (empty string) to not create one.
      mappings = {
        close = "q",
        go_in = "L",
        go_in_plus = "l",
        go_out = "H",
        go_out_plus = "h",
        reset = "<BS>",
        reveal_cwd = "`",
        show_help = "g?",
        synchronize = "=",
        trim_left = "<",
        trim_right = ">",
      },

      -- General options
      options = {
        -- Whether to delete permanently or move into module-specific trash
        permanent_delete = true,
        -- Whether to use for editing directories
        use_as_default_explorer = true,
      },

      -- Customization of explorer windows
      windows = {
        max_number = 3,
        preview = false,
        width_focus = 60,
        width_nofocus = 25,
        width_preview = 80,
      },
    })
    map("n", "-", function()
      mini.open(vim.api.nvim_buf_get_name(0))
    end, { desc = "Open mini" })

    vim.api.nvim_create_autocmd("User", {
      group = vim.api.nvim_create_augroup("Mini Open", { clear = true }),
      pattern = "MiniFilesWindowUpdate",
      callback = function(ev)
        vim.wo[ev.data.win_id].number = true
        vim.wo[ev.data.win_id].relativenumber = true
      end,
    })
  end,
}
