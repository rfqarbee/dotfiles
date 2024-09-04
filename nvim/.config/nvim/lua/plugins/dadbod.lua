return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_win_position = "right"
    local map = require("utils.mapkey")

    map("n", "<leader>do", "<cmd>DBUIToggle<cr>")

    vim.api.nvim_create_autocmd("User", {
      group = vim.api.nvim_create_augroup("Dadbod", { clear = true }),
      callback = function()
        local i = 0
        if vim.bo.filetype == "dbui" then
        else
          -- map("n", "<leader>do", "<cmd>tabnew | DBUIToggle<cr>")
        end
      end,
    })
  end,
}
