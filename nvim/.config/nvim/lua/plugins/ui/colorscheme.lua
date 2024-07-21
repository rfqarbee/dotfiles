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
      -- vim.cmd.colorscheme("tokyonight")
    end,
  },
  --kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = false,
        theme = "dragon",
        background = {
          dark = "dragon",
          light = "lotus",
        },
      })
      -- vim.cmd.colorscheme("kanagawa")
    end,
  },
  -- grubbox
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_dim_inactive_windows = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"
      vim.g.gruvbox_material_diagnostic_text_highlight = 0
      vim.cmd("colorscheme gruvbox-material")
    end,
  },
  -- doom-one
  -- BUG: diagnostic icon is not changing for lsp
  {
    "NTBBloodbath/doom-one.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.doom_one_cursor_coloring = false
      vim.g.doom_one_terminal_colors = false
      -- Enable italic comments
      vim.g.doom_one_italic_comments = true
      -- Enable TS support
      vim.g.doom_one_enable_treesitter = true
      -- Color whole diagnostic text or only underline
      vim.g.doom_one_diagnostics_text_color = false
      -- Enable transparent background
      vim.g.doom_one_transparent_background = false

      -- Pumblend transparency
      vim.g.doom_one_pumblend_enable = false
      vim.g.doom_one_pumblend_transparency = 20

      -- Plugins integration
      vim.g.doom_one_plugin_neorg = true
      vim.g.doom_one_plugin_telescope = true
      vim.g.doom_one_plugin_neogit = true
      vim.g.doom_one_plugin_dashboard = true
      vim.g.doom_one_plugin_whichkey = true
      vim.g.doom_one_plugin_indent_blankline = true
    end,
  },
}
