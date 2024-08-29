return {
  {
    "stevearc/oil.nvim",
    enabled = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local oil = require("oil")

      oil.setup({
        columns = {
          "icon",
        },
        view_options = {
          show_hidden = true,
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
        },
        float = {
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
        use_default_keymaps = false,
        delete_to_trash = true, -- in $XDG_DATA_HOME/Trash
        skip_confirm_for_simple_edits = true,
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-w>v"] = "actions.select_vsplit",
          ["<C-w>s"] = "actions.select_split",
          ["<C-w>t"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["q"] = "actions.close",
          ["<space>r"] = "actions.refresh", -- refresh list
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["."] = "actions.cd", -- change project directory
          ["`"] = "actions.tcd", -- change current tab directory
          ["gs"] = "actions.change_sort",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
      })

      -- vim.keymap.set("n", "<leader>", function()
      --   require("oil").open()
      -- end, { desc = "Float oil" })
      vim.keymap.set("n", "<leader>-", function()
        require("oil").open()
      end, { desc = "Oil -> Directory" })
    end,
  },
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
