return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        transparent = true,
      })
      vim.cmd.colorscheme("tokyonight-storm")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
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
