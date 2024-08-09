return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    local utils = require("utils.helper")

    telescope.setup({
      defaults = {
        mappings = utils.telescope_mappings,
        -- buffer_previewer_maker = utils.telescope_new_maker,
        path_display = {
          truncate = 3,
          -- shorten = { len = 5, exclude = { 1, -2, -1 } },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
        },
        winblend = 0,
      },
      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--hidden",
            -- "-u",
            "--glob",
            "!**/.git/*",
          },
          -- BUG: i dont fucking know why but <CR> doesnt work in find files
          mappings = {
            i = {
              ["<CR>"] = actions.select_default,
            },
            n = {
              ["<CR>"] = actions.select_default,
            },
          },
        },
        help_tags = {
          mappings = {
            i = {
              ["<CR>"] = actions.select_default,
            },
            n = {
              ["<CR>"] = actions.select_default,
            },
          },
        },
        grep_string = {
          initial_mode = "normal",
          mappings = {
            i = {
              ["<CR>"] = actions.select_default,
            },
            n = {
              ["<CR>"] = actions.select_default,
            },
          },
        },
        buffers = {
          initial_mode = "normal",
          mappings = utils.telescope_buffer,
        },
        current_buffer_fuzzy_find = {
          previewer = false,
          mappings = {
            i = {
              ["<CR>"] = actions.select_default,
            },
            n = {
              ["<CR>"] = actions.select_default,
            },
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    pcall(telescope.load_extension, "fzf")

    vim.keymap.set("n", "<leader>f.", function()
      builtin.oldfiles({ only_cwd = true })
    end, { desc = "Recent files (extension)", noremap = true, silent = true })

    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Find Git Files" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep current word" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fd", function()
      builtin.find_files({ find_command = { "fd", "-mindepth", "1", "--type", "d" } })
    end, { desc = "Find Directories" })
    vim.keymap.set("n", "<leader>fi", builtin.commands, { desc = "Help tags" })
    vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })

    vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Search current buffer" })

    vim.keymap.set("n", "<leader>fo", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "Live grep open files" })

    vim.keymap.set("n", "<leader>fc", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Neovim config" })
  end,
}
