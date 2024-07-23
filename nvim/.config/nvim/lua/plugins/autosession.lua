return {
  "rmagatti/auto-session",
  dependencies = {
    "nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
  },
  config = function()
    require("auto-session").setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Downloads", "~/dev", "~/work", "~/repos", "/", "~/dotfiles" },
    })

    vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<cr>", { desc = "Restore session for cwd" })
    vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<cr>", { desc = "Save session for cwd" })
  end,
}
