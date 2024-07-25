return {
  "tpope/vim-fugitive",
  enabled = false,
  config = function()
    vim.keymap.set("n", "<leader>go", ":tab Git <CR>", { desc = "Open Fugitive" })
    vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit <CR>", { desc = "Open Fugitive" })
  end,
}
