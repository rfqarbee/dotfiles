return {
  -- tokyonight
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
  -- one dark
  {
    "navarasu/onedark.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "cool",
        transparent = false,
        term_colors = false,
        ending_tildes = false,
        cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
        -- toggle theme style ---
        toggle_style_key = "<leader>ct", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

        -- Options are italic, bold, underline, none
        code_style = {
          comments = "italic",
          keywords = "none",
          functions = "none",
          strings = "none",
          variables = "none",
        },

        -- Lualine options --
        lualine = {
          transparent = false, -- lualine center bar transparency
        },

        -- Custom Highlights --
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

        -- Plugins Config --
        diagnostics = {
          darker = false, -- darker colors for diagnostic
          undercurl = false, -- use undercurl instead of underline for diagnostics
          background = true, -- use background color for virtual text
        },
      })

      vim.cmd("colorscheme onedark")
    end,
  },
}
