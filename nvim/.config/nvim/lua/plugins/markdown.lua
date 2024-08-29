return {
  {
    "MeanderingProgrammer/markdown.nvim",
    enabled = true,
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("render-markdown").setup({
        checkbox = {
          enabled = true,
          unchecked = {
            icon = "󰄱 ",
            highlight = "NormalNC",
          },
          checked = {
            icon = " ",
            highlight = "FloatFooter",
          },
          custom = {
            todo = { raw = "[/]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
            placeholder = { raw = "[>]", rendered = " ", highlight = "RenderMarkdownTodo" },
            priority = { raw = "[!]", rendered = " ", highlight = "WarningMsg" },
            cancel = { raw = "[~]", rendered = "󰜺 ", highlight = "ErrorMsg" },
          },
        },
        win_options = {
          conceallevel = {
            rendered = 2,
          },
        },
      })
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = true,
    cond = function()
      local vault = "~/Documents/Vaults"
      local path = vim.fn.getcwd()
      if vault == path then
        return true
      else
        return false
      end
    end,
    ft = "markdown",
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "notesidian",
            path = "~/Documents/Vaults",
            overrides = {
              daily_notes = {
                folder = "1. Quicknotes",
                date_format = "%d-%m-%Y",
                alias_format = "%B %-d,%Y",
                default_tags = { "quicknotes" },
              },
            },
          },
          {
            name = "test",
            path = "~/Documents/test",
            overrides = {
              notes_subdir = "notes",
              daily_notes = {
                folder = "notes/dailes",
                date_format = "%d-%m-%Y",
                alias_format = "%B %-d,%Y",
                default_tags = { "quicknotes" },
              },
            },
          },
        },
        note_id_func = function(title)
          local suffix = ""
          if title ~= nil then
            suffix = title
          else
            for _ = 1, 4 do
              suffix = suffix .. string.char(math.random(65, 90))
            end
          end

          return suffix
        end,

        log_level = vim.log.levels.INFO,
        templates = {
          folder = "Templates",
          date_format = "%d/%m/%Y",
          time_format = "%H:%M",
        },
        ui = {
          enable = false,
          checkboxes = {
            [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
            ["x"] = { char = "", hl_group = "ObsidianDone" },
            ["/"] = { char = "󰥔", hl_group = "ObsidianRightArrow" },
            [">"] = { char = "", hl_group = "ObsidianRightArrow" },
            ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
            ["!"] = { char = "", hl_group = "ObsidianImportant" },
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
          ["<CR>"] = {
            action = function()
              return require("obsidian").util.smart_action()
            end,
            opts = { desc = "Smart action", expr = true, buffer = true },
          },
          ["<leader>oc"] = {
            action = function()
              return require("obsidian").util.toggle_checkbox()
            end,
            opts = { desc = "Toggle Checkbox (obs)", buffer = true },
          },
          ["<leader>on"] = {
            action = "<cmd>ObsidianDailies<cr>",
            opts = { desc = "Quick notes" },
          },
          ["<leader>od"] = {
            action = "<cmd>ObsidianToday +1<cr>",
            opts = { desc = "Notes Tomorrow" },
          },
          ["<leader>ox"] = {
            action = "<cmd>ObsidianTags<cr>",
            opts = { desc = "Obsidian Tags", buffer = true },
          },
          ["<leader>ot"] = { action = "<cmd>ObsidianTemplate<cr>", opts = { desc = "Template", buffer = true } },
          ["<leader>ov"] = {
            action = "<cmd>ObsidianBacklinks vsplit<cr>",
            opts = { desc = "ObsidianBacklinks", buffer = true },
          },
        },
      })
      vim.keymap.set("v", "<leader>ol", ":ObsidianLinkNew<cr>", { desc = "Create obsidian link", buffer = true })
      vim.keymap.set(
        "v",
        "<leader>oe",
        ":ObsidianExtractNote<cr>",
        { desc = "Extract note and create links", buffer = true }
      )
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    enabled = true,
    Event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    -- cond = function()
    --   local getos = os.getenv("OS")
    --   local windowPath = "C:\\Users\\muhammadrafiq\\Documents\\Vaults"
    --   local defaultOS = "/home/rafiq/Documents/Vaults"
    --
    --   -- this is only for my work laptop
    --   if getos ~= nil and string.find(getos:lower(), "windows") then
    --     if vim.fn.getcwd() == windowPath then
    --       return true
    --     end
    --   else
    --     if vim.fn.getcwd() == defaultOS then
    --       return true
    --     end
    --   end
    -- end,
    keys = {
      { "<leader>nt", "<cmd>Neotree toggle<cr>", desc = "Neotree" },
    },
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
    end,
  },
}
