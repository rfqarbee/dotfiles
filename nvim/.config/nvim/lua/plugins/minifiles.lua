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
        go_in = "l",
        go_in_plus = "<CR>",
        go_out = "H",
        go_out_plus = "h",
        reset = "<BS>",
        reveal_cwd = "`",
        show_help = "",
        synchronize = "<c-s>",
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

    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        -- Make new window and set it as target
        local new_target_window
        vim.api.nvim_win_call(mini.get_target_window(), function()
          vim.cmd(direction .. " split")
          new_target_window = vim.api.nvim_get_current_win()
        end)

        mini.set_target_window(new_target_window)
      end

      -- Adding `desc` will result into `show_help` entries
      local desc = "Split " .. direction
      vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        print("does it go enter enter", vim.inspect(args))
        local buf_id = args.data.buf_id
        -- Tweak keys to your liking
        map_split(buf_id, "<C-w>s", "belowright horizontal")
        map_split(buf_id, "<C-w>v", "belowright vertical")
      end,
    })
  end,
}
