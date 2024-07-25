-- neogit
return {
  "NeogitOrg/neogit",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>go", "<cmd>Neogit cwd=%:p:h<cr>", desc = "Git cwd" },
    { "<leader>gp", "<cmd>Neogit<cr>", desc = "Git Project root" },
    { "<leader>gd", "<cmd>Neogit diff<cr>", desc = "Neogit Diff" },
  },
  opts = {},
}
