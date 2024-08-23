return {
  "tpope/vim-fugitive",
  keys = {
    { "gs", "<cmd>Git | resize 40<cr>", silent = true, desc = "Git status" },
    { "<leader>gd", "<cmd>Gvdiffsplit <cr>", silent = true, desc = "Git diff split" },
    { "<leader>gl", "<cmd>Gllog <cr>", silent = true, desc = "Git log" },
  },
}
