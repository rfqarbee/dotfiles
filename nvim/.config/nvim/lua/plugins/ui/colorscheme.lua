return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        transparent = false,
        styles = {
          comments = { italic = true },
          keywords = { italic = false },
          sidebars = "dark",
          floats = "dark",
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

      -- vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "deep",
        transparent = false,

        code_style = {
          comments = "italic",
          keywords = "none",
          functions = "none",
          strings = "none",
          variables = "none",
        },

        lualine = {
          transparent = true,
        },

        colors = {
          hint = "#86e1fc",
          vhint = "#2c374a",
          info = "#82aaff",
          vinfo = "#2c314a",
          error = "#ff757f",
          warn = "#ffa500",
        },
        highlights = {
          DiagnosticHint = { fg = "$hint" },
          DiagnosticVirtualTextHint = { fg = "$hint", bg = "$vhint" },
          DiagnosticUnderlineHint = { sp = "$hint" },

          DiagnosticInfo = { fg = "$info" },
          DiagnosticVirtualTextInfo = { fg = "$info", bg = "$vinfo" },
        },

        diagnostics = {
          darker = false,
          undercurl = true,
          background = false,
        },
      })

      vim.cmd("colorscheme onedark")
    end,
  },
}
