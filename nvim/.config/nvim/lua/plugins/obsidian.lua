return {
  -- obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      -- see below for full list of optional dependencies 👇
    },
    cond = function()
      local getos = os.getenv("OS")
      local windowPath = "C:\\Users\\muhammadrafiq\\Documents\\Vaults"
      local defaultOS = "/home/rafiq/Documents/Vaults"

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
      local obs = require("obsidian")

      obs.setup({
        workspaces = {
          -- make dir as workspace
          -- {
          -- 	name = "Daily",
          -- 	path = "~/Documents/Vaults/Daily",
          -- 	strict = true,
          -- },
          {
            name = "Work",
            path = "~/Documents/Vaults/Work",
            strict = true,
          },
          {
            name = "Personal",
            path = "~/Documents/Vaults/Personal",
            strict = true,
          },
          {
            name = "Documentation",
            path = "~/Documents/Vaults/Documentation",
            strict = true,
          },
        },
        log_level = vim.log.levels.INFO,
        -- notes_subdir = "notes",
        -- new_notes_location = "notes_subdir",
        daily_notes = {
          folder = "daily",
          date_format = "%d-%m-%Y",
          default_tags = { "daily-notes" },
          template = "dailytemplates.md",
        },
        completion = {
          -- Set to false to disable completion.
          nvim_cmp = true,
          -- Trigger completion at 2 chars.
          min_chars = 2,
        },
        templates = {
          folder = "~/Documents/Vaults/templates",
          date_format = "%d-%m-%Y",
          time_format = "%H:%M",
          substitutions = {
            -- increment -- TODO: increase index for daily template
          },
        },
        preferred_link_style = "wiki",
      })

      vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<cr>", { desc = "Obsidian Template" })
      vim.keymap.set("n", "<leader>oc", function()
        obs.util.toggle_checkbox()
      end, { desc = "Toggle checkbox" })
      vim.keymap.set("n", "gf", function()
        obs.util.gf_passthrough()
      end, { desc = "GF passthrough", noremap = false, expr = true, buffer = true })
      vim.keymap.set("n", "<CR>", function()
        obs.util.smart_action()
      end, { desc = "Smart Action" })
    end,
  },

  -- neotree (only load in vaults)
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   Event = "VeryLazy",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --   },
  --   cond = function()
  --     local getos = os.getenv("OS")
  --     local windowPath = "C:\\Users\\muhammadrafiq\\Documents\\Vaults"
  --     local defaultOS = "/home/rafiq/Documents/Vaults"
  --
  --     -- this is only for my work laptop
  --     if getos ~= nil and string.find(getos:lower(), "windows") then
  --       if vim.fn.getcwd() == windowPath then
  --         return true
  --       end
  --     else
  --       if vim.fn.getcwd() == defaultOS then
  --         return true
  --       end
  --     end
  --   end,
  --   config = function()
  --     require("neo-tree").setup({
  --       enable_diagnostics = false,
  --       close_if_last_window = true,
  --       window = {
  --         position = "right",
  --         width = 45,
  --       },
  --       filesystem = {
  --         follow_current_file = {
  --           leave_dirs_open = true,
  --         },
  --       },
  --     })
  --
  --     vim.keymap.set("n", "<leader>on", "<cmd>Neotree focus<cr>", { desc = "Switch to Tree" })
  --   end,
  -- },
}
