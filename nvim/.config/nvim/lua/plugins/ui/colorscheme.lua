return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    config = function()
      require("rose-pine").setup({
        variant = "moon",
        styles = {
          transparency = true,
        },
      })
      -- vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        italic_comments = true,
        transparent = false,
        borderless_telescope = false,
      })
      -- vim.cmd("colorscheme cyberdream")
    end,
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local od = require("onedark")
      od.setup({
        style = "dark",
        highlights = {
          ["DiagnosticVirtualTextError"] = { fg = "#ff757f" },
          ["DiagnosticVirtualTextWarn"] = { fg = "#ffa500" },
          ["DiagnosticVirtualTextInfo"] = { fg = "#82aaff" },
          ["DiagnosticVirtualTextHint"] = { fg = "#86e1fc" },
          ["DiagnosticError"] = { fg = "#ff757f" },
          ["DiagnosticWarn"] = { fg = "#ffa500" },
          ["DiagnosticInfo"] = { fg = "#82aaff" },
          ["DiagnosticHint"] = { fg = "#86e1fc" },
          ["LspDiagnosticsVirtualTextHint"] = { fg = "#86e1fc", bg = "none" },
          ["LspDiagnosticsVirtualTextHinting"] = { fg = "#86e1fc", bg = "none" },
          ["LspDiagnosticsVirtualTextWarn"] = { fg = "#ffa500", bg = "none" },
          ["LspDiagnosticsVirtualTextWarning"] = { fg = "#ffa500", bg = "none" },
          ["LspDiagnosticsVirtualTextInfo"] = { fg = "#82aaff", bg = "none" },
          ["LspDiagnosticsVirtualTextError"] = { fg = "#ff757f", bg = "none" },
        },
      })
      od.load()
    end,
  },
}
