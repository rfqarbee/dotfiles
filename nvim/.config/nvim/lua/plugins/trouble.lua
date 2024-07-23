return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/lsp-colors.nvim" },
  cmd = "Trouble",
  keys = {
    { "<leader>qs", "<cmd>Trouble diag_priority open<cr>", "Project diagnostics on severity" },
    { "<leader>qd", "<cmd>Trouble diagnostics_buffer open<cr>", "Current diagnostics" },
    { "<leader>qw", "<cmd>Trouble diagnostics open<cr>", "Project diagnostics" },
    { "<leader>qn", "<cmd>Trouble todo toggle<cr>", "Todo list" },
    { "<leader>qt", "<cmd>Trouble telescope open<cr>", "Telescope Quickfix list" },
    { "<leader>qf", "<cmd>Trouble telescope_files open<cr>", "Telescope Files Quickfix list" },
    { "<leader>qq", "<cmd>Trouble quickfix open<cr>", "Toggle Quickfix list" },
    { "<leader>ql", "<cmd>Trouble loclist open<cr>", "Toggle Loclist list" },
    { "<leader>qQ", "<cmd>Trouble qflist open<cr>", "Toggle Qflist" },
    {
      "<leader>xs",
      "<cmd>Trouble symbols toggle pinned=true results.win.relative=win results.win.position=right<cr>",
      "Document Symbol list",
    },
    {
      "<leader>tS",
      "<cmd>Trouble lsp_document_symbols toggle<cr>",
      "Lsp Document symbols",
    },
    { "<leader>td", "<cmd>Trouble lsp_definitions open<cr>", "Lsp Definition" },
    { "<leader>tD", "<cmd>Trouble lsp_declarations open<cr>", "Lsp Declaration" },
    { "<leader>tt", "<cmd>Trouble lsp open win.position=right<cr>", "Lsp" },
  },
  opts = {
    focus = true,
    follow = true,
    win = {
      size = 45,
      position = "right",
    },
    modes = {
      -- todo
      todo = {
        mode = "todo",
        win = { size = 40, position = "left" },
      },
      -- diagnostics change window
      diagnostics = {
        mode = "diagnostics",
        win = { size = 12, position = "bottom" },
      },
      -- diagnostics current buffer with preview
      diagnostics_buffer = {
        desc = "Current Buffer diagnostics",
        mode = "diagnostics",
        filter = { buf = 0 },
        -- pinned = true,
        win = {
          position = "bottom",
          size = 12,
        },
        -- preview = {
        --   type = "split",
        --   relative = "win",
        --   position = "right",
        --   size = 0.5,
        -- },
      },
      -- base on severity
      diag_priority = {
        mode = "diagnostics",
        desc = "Diagnostics on severity",
        filter = function(items)
          local severity = vim.diagnostic.severity.HINT
          for _, item in ipairs(items) do
            severity = math.min(severity, item.severity)
          end
          return vim.tbl_filter(function(item)
            return item.severity == severity
          end, items)
        end,
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.5,
        },
        win = { position = "bottom", size = 10 },
      },
      -- project diagnostics
      diagnostics_project = {
        mode = "diagnostics",
        win = {
          position = "bottom",
          size = 12,
        },
        filter = {
          any = {
            buf = 0,
            {
              severity = vim.diagnostic.severity.ERROR,
              function(item)
                return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
              end,
            },
          },
        },
      },
    },
  },
}
