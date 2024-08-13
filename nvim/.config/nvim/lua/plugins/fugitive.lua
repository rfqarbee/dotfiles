return {
  "tpope/vim-fugitive",
  enabled = true,
  config = function()
    vim.keymap.set("n", "<leader>gs", ":Git <CR>", { silent = true, desc = "Open Fugitive" })
    vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit <CR>", { desc = "Diff split" })
  end,
}
