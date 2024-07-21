return {
  -- markdown preview
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    enabled = true,
    config = function()
      require("render-markdown").setup({})
    end,
  },
  -- obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    -- lazy = ,
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      -- see below for full list of optional dependencies 👇
    },
    cond = function()
      local getos = os.getenv("OS")
      local windowPath = "C:\\Users\\muhammadrafiq\\Documents\\vaults"
      local defaultOS = "/home/rafiq/Documents/vaults"

      if getos ~= nil and string.find(getos:lower(), "windows") then
        if vim.fn.getcwd() == windowPath then
          return true
        end
      else
        if vim.fn.getcwd() == defaultOS then
          return true
        end
      end
    end,
    opts = {
      workspaces = {
        {
          name = "projects",
          path = "~/Documents/vaults/projects",
          strict = true,
          overrides = {},
        },
        {
          name = "documentation",
          path = "~/Documents/vaults/documentation",
          strict = true,
          overrides = {},
        },
        {
          name = "personal",
          path = "~/Documents/vaults/personal",
          strict = true,
          overrides = {
            notes_subdir = "scratch",
            daily_notes = {
              folder = "scratch/",
              date_format = "%d/%m/%Y",
              alias_format = "test idk whats this",
              default_tags = { "daily-notes" },
              -- template = "scratch_template.md",
            },
          },
        },
      },
      log_level = vim.log.levels.INFO,
      templates = {
        folder = "~/Documents/vaults/templates",
        date_format = "%d/%m/%Y",
        time_format = "%H:%M",
        substitutions = {
          -- increment -- TODO: increase index for daily template
        },
      },
      preferred_link_style = "wiki",
      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { desc = "GF passthru", noremap = false, expr = true, buffer = true },
        },
        ["<leader>oc"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { desc = "Toggle Checkbox (obs)", buffer = true },
        },
        ["<CR>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { desc = "Smart Action (obs)", expr = true, buffer = true },
        },
        ["<leader>ot"] = { action = "<cmd>ObsidianTemplate<cr>", opts = { desc = "Template", buffer = true } },
      },
    },
  },

  -- neotree (only load in vaults)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    Event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    cond = function()
      local getos = os.getenv("OS")
      local windowPath = "C:\\Users\\muhammadrafiq\\Documents\\vaults"
      local defaultOS = "/home/rafiq/Documents/vaults"

      -- this is only for my work laptop
      if getos ~= nil and string.find(getos:lower(), "windows") then
        if vim.fn.getcwd() == windowPath then
          return true
        end
      else
        if vim.fn.getcwd() == defaultOS then
          return true
        end
      end
    end,
    config = function()
      require("neo-tree").setup({
        enable_diagnostics = false,
        close_if_last_window = true,
        window = {
          position = "right",
          width = 45,
        },
        filesystem = {
          follow_current_file = {
            leave_dirs_open = true,
          },
        },
      })

      vim.keymap.set("n", "<leader>on", "<cmd>Neotree focus<cr>", { desc = "Switch to Tree" })
    end,
  },
}
