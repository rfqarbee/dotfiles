return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      auto_restore_enabled = true,
      auto_session_suppress_dirs = { "~/", "~/Downloads", "~/dev", "~/work", "~/repos", "/", "~/dotfiles" },
    })

    vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<cr>", { desc = "Restore session for cwd" })
    vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<cr>", { desc = "Save session for cwd" })
  end,
}
