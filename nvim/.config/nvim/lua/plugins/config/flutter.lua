return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  enabled = false,
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = function()
    require("flutter-tools").setup({})

    local map = function(lhs, rhs, opts)
      vim.keymap.set("n", lhs, rhs, { desc = opts })
    end

    map("<leader>fo", "<cmd>FlutterOutlineToggle<cr>", "Flutter Outline Toggle")
    map("<leader>fd", "<cmd>FlutterDevToolsActivate<cr>", "Flutter Dev Tools Activate")
    map("<leader>fr", "<cmd>FlutterLspRestart<cr>", "Flutter Restart LSP")
    map("<leader>fs", "<cmd>FlutterSuper<cr>", "Flutter Super Class")
    map("<leader>fn", "<cmd>FlutterRename<cr>", "Flutter Rename")
  end,
}
