return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "smartpde/telescope-recent-files" },
    { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0," },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    local open_trouble = require("trouble.sources.telescope").open
    local themes = require("telescope.themes")

    telescope.setup({
      defaults = {
        preview = {
          hide_on_startup = false,
        },
        path_display = {
          -- "truncate",
          shorten = { len = 1, exclude = { 1, 2, -2, -1 } },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim", -- add this value },
        },
        mappings = {
          i = {
            -- ["<C-c>"] = actions.close,
            ["<M-e>"] = actions.close,
            ["<C-h>"] = "which_key",
            ["<C-u>"] = false,
            ["<C-p>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-k>"] = actions.preview_scrolling_up,
            ["<C-j>"] = actions.preview_scrolling_down,
            ["<C-t>"] = open_trouble,
            ["<C-f>"] = actions.add_selection,
            ["<C-r>"] = actions.remove_selection,
            ["<C-e>"] = actions.drop_all,
            ["<C-d>"] = actions.delete_buffer,
            ["<C-q>"] = actions.send_selected_to_qflist,
            ["<C-a>"] = actions.add_selected_to_qflist,
            ["<M-q>"] = actions.send_to_qflist,
            ["<M-a>"] = actions.add_to_qflist,
            ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
          },
          n = {
            ["f"] = actions.add_selection,
            ["r"] = actions.remove_selection,
            ["e"] = actions.drop_all,
            ["d"] = actions.delete_buffer,
            ["q"] = actions.send_selected_to_qflist,
            ["a"] = actions.add_selected_to_qflist,
            ["Q"] = actions.send_to_qflist,
            ["A"] = actions.add_to_qflist,
            ["t"] = open_trouble,
            ["<M-e>"] = actions.close,
            ["<M-p>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
        winblend = 0,
        initial_mode = "insert",
      },
      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--glob",
            "!**/.git/*",
          },
        },
      },
      extensions = {
        ["ui-select"] = { themes.get_cursor() },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        live_grep_args = {
          mappings = {
            i = {
              ["<c-o"] = require("telescope-live-grep-args.actions").quote_prompt(),
              ["<c-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
              ["<c-space"] = actions.to_fuzzy_refine,
            },
          },
        },
      },
    })

    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")
    pcall(telescope.load_extension, "recent_files")
    pcall(telescope.load_extension, "live_grep_args")

    vim.keymap.set("n", "<leader>f.", function()
      telescope.extensions.recent_files.pick()
    end, { noremap = true, silent = true })

    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set("n", "<M-e>", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep current word" })
    vim.keymap.set("n", "<leader>fg", telescope.extensions.live_grep_args.live_grep_args, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fd", function()
      builtin.find_files({ find_command = { "fd", "--type", "d" } })
    end, { desc = "Find Directories" })
    vim.keymap.set("n", "<leader>fi", builtin.commands, { desc = "Help tags" })
    vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })

    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown({
        -- layout_strategy = "horizontal",
        sorting_strategy = "descending",
        layout_config = { height = 35, width = 100 },
        winblend = 0,
        previewer = false,
      }))
    end, { desc = "Search current buffer" })

    vim.keymap.set("n", "<leader>fo", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "Live grep open files" })

    -- goto neovim config
    vim.keymap.set("n", "<leader>fc", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Neovim config" })
  end,
}
