return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        transparent = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = false },
          sidebars = "transparent",
          floats = "transparent",
        },
        plugins = {
          gitsigns = true,
          trouble = true,
          lualine = true,
        },
        on_colors = function(colors)
          colors.hint = colors.cyan
          colors.error = colors.red
          colors.warn = colors.orange
          colors.info = colors.blue
        end,
      })

      -- this is a comment
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        transparent_background = true,
        show_end_of_buffer = true,
      })
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
}
