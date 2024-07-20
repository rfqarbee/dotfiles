return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      -- theme = "tokyonight",
      theme = "auto",
      -- component_separators = { left = " ", right = "" },
      -- section_separators = { left = "|", right = "|" },
      disabled_filetypes = {
        statusline = { "fugitive", "trouble", "oil", "undotree" },
      },
    },
    sections = {
      lualine_c = {
        {
          "filename",
          path = 4,
          symbols = {
            modified = "<+>",
            readonly = "<ReadOnly>",
            unnamed = "",
            newfile = "<New>",
          },
        },
      },
    },
    extensions = { "quickfix", "mason" },
  },
}
