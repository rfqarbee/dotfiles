return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    "ibhagwan/fzf-lua", -- optional
  },
  opts = function(_, opts)
    opts.disable_line_numbers = false
    opts.disable_insert_on_commit = true
    vim.keymap.set("n", "<leader>ns", "<cmd>Neogit<cr>", { desc = "Git status" })
    vim.keymap.set("n", "<leader>nf", "<cmd>Neogit cwd=%:p:h<cr>", { desc = "Git status" })
    vim.keymap.set("n", "<leader>nc", "<cmd>Neogit commit<cr>", { desc = "Git status" })
  end,
}
