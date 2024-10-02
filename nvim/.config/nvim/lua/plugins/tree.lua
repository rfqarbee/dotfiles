return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional
  },
  keys = {
    { "<leader>nt", "<cmd>NvimTreeToggle<cr>", desc = "Neotree" },
  },
  opts = {
    view = {
      side = "right",
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          folder_arrow = false,
        },
      },
    },
  },
}
