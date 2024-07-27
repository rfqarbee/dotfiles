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
    { "<leader>gf", "<cmd>Neogit cwd=%:p:h<cr>", desc = "Git status (File Path)" },
    { "<leader>go", "<cmd>Neogit<cr>", desc = "Git Status (Root)" },
    { "<leader>gd", "<cmd>Neogit diff<cr>", desc = "Neogit Diff" },
  },
  opts = {
    disable_line_numbers = false,
  },
}
