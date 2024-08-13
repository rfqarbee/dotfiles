return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  enabled = true,
  keys = {
    {
      "<leader>k",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function()
    local w = require("which-key")
    w.setup({
      plugins = {
        marks = true,
        registers = false,
        spelling = {
          enabled = true,
        },
      },
    })
    w.add({
      { "<leader>h", group = "Harpoon : " },
      { "<leader>f", group = "Telescope : " },
      { "<leader>q", group = "Trouble : " },
      { "<leader>l", group = "LSP : " },
      { "<leader>g", group = "Git : " },
      { "<leader>d", group = "Dap : " },
      { "<leader>w", group = "Workspace : " },
      { "<leader>c", group = "Lsp (Telescope) : " },
    })
  end,
}
