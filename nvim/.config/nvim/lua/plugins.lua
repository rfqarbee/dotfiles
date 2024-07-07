-- plugins with simple configuration

return {
  -- tpope W
  "tpope/vim-sleuth",

  -- auto session
  {
    "rmagatti/auto-session",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
    },
    config = function()
      require("auto-session").setup({
        auto_restore_enabled = false,
        auto_session_suppress_dirs = { "~/", "~/Downloads", "~/dev", "~/work", "~/repos", "/", "~/dotfiles" },
      })

      vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<cr>", { desc = "Restore session for cwd" })
      vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<cr>", { desc = "Save session for cwd" })
    end,
  },
  -- whichkey
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local w = require("which-key")

      w.register({
        h = "Harpoon",
        ["<C-s>"] = "Save file",
        ["<C-q>"] = "Quit neovim",
        ["<C-x>"] = "Source & execute",
        ["-"] = "Oil -> Directory",
        -- f = { name = "Telescope" },
        t = "Telescope",
        q = "Trouble",
        m = "Format",
        l = "Lsp",
        g = "Git",
      }, { prefix = "<leader>" })
    end,
  },

  -- tmux navigator
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },

  -- nvim colorizer (nvchad fork)
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({})
    end,
  },

  -- comment (for tsx,jsx file)
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    enabled = true,
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" }, -- for tsx jsx
    config = function()
      local comment = require("Comment")
      local ts_context_comment = require("ts_context_commentstring.integrations.comment_nvim")

      comment.setup({
        pre_hook = ts_context_comment.create_pre_hook(),
      })
    end,
  },

  -- nvim-notify
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    enabled = true,
    config = function()
      local notify = require("notify")

      vim.notify = notify
      notify.setup({
        fps = 240,
        stages = "slide",
        timeout = 5000,
        max_height = function()
          return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
          return math.floor(vim.o.columns * 0.75)
        end,
        on_open = function(win)
          vim.api.nvim_win_set_config(win, { zindex = 100 })
        end,
      })
    end,
  },

  -- dressing

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  -- flash
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },

  -- folke's todo-comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- opts = {},
    config = function()
      require("todo-comments").setup({
        keywords = {
          FIX = {
            icon = " ",
            color = "error",
            alt = { "BUG", "ISSUE" },
          },
          TODO = { icon = " ", color = "info" },
          WARN = { icon = " ", color = "#ffbe3d", alt = { "WARNING", "TEMP" } },
          PERF = { icon = " ", color = "#5cfe97", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "#5ca5fe", alt = { "INFO" } },
          TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
      })
    end,
  },

  -- twilight and zen
  {
    "folke/zen-mode.nvim",
    dependencies = {
      "folke/twilight.nvim",
    },
    keys = {
      { "<leader>zm", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
    opts = {
      plugins = {
        tmux = { enabled = true },
        kitty = {
          enabled = true,
        },
      },
    },
  },
}
