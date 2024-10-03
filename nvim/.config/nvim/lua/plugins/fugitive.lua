return {
  "tpope/vim-fugitive",
  enabled = false,
  config = function()
    vim.keymap.set("n", "gs", "<cmd>Git<cr>", { silent = true, desc = "Git status" })
    vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<cr>", { silent = true, desc = "Git status" })
    vim.keymap.set("n", "<leader>gl", "<cmd>Gllog<cr>", { silent = true, desc = "Git status" })
  end,
}
