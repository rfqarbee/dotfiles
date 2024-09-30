return {
  "otavioschwanck/arrow.nvim",
  opts = {
    hide_handbook = false,
    show_icons = true,
    leader_key = "\\",
    buffer_leader_key = "'",
    mappings = {
      next_item = "j",
      prev_item = "k",
    },
    window = { -- controls the appearance and position of an arrow window (see nvim_open_win() for all options)
      width = 120,
      height = 15,
      row = 10,
      col = 30,
      border = "single",
      -- width = 120,
      -- height = 20,
      -- row = 15,
      -- col = 50,
      -- border = "single",
    },
    per_buffer_config = {
      lines = 5,
    },
  },
}
