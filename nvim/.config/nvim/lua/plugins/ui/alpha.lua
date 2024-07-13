return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local dashboard = require("alpha.themes.dashboard")

    local title = require("plugins.ui.acsii.logo")
    dashboard.section.header.val = title.neovim

    dashboard.section.buttons.val = {
      dashboard.button("SPC -  ", "󰏇  File Explorer"),
      dashboard.button("SPC w r", "  Open Session"),
      dashboard.button("<M-e> ", "  Find file"),
      dashboard.button("e ", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("SPC .  ", "  Recent"),
      dashboard.button("n ", "  Neovim Config", ":e $XDG_CONFIG_HOME/nvim/init.lua | :cd %:p:h | pwd<CR>"),
      dashboard.button("q ", "󰅚  Quit NVIM", ":qa<CR>"),
    }

    require("alpha").setup(dashboard.config)

    vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])
  end,
}
