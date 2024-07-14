return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      -- theme = "ayu_dark",
      theme = "tokyonight",
      component_separators = { left = " ", right = "" },
      -- section_separators = { left = "|", right = "|" },
      disabled_filetypes = {
        statusline = { "trouble", "oil" },
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
