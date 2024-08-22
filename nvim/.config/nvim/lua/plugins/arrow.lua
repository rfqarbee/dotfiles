return {
  "otavioschwanck/arrow.nvim",
  opts = {
    hide_handbook = false,
    show_icons = true,
    leader_key = "\\",
    buffer_leader_key = "m",
    mappings = {
      next_item = "j",
      prev_item = "k",
    },
    window = {
      width = 120,
      height = 20,
      row = 15,
      col = 50,
      border = "single",
    },
    per_buffer_config = {
      lines = 5,
    },
  },
}
