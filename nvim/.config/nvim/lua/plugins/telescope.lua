return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "smartpde/telescope-recent-files" },
  },
  config = function()
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    local open_trouble = require("trouble.sources.telescope").open
    local themes = require("telescope.themes")

    require("telescope").setup({
      defaults = {
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
            ["<C-t>"] = open_trouble,
            ["<M-e>"] = actions.close,
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
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
    pcall(require("telescope").load_extension, "recent_files")

    vim.keymap.set("n", "<leader>fb", function()
      require("telescope").extensions.recent_files.pick()
    end, { noremap = true, silent = true })

    vim.keymap.set("n", "<M-e>", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<M-w>", builtin.grep_string, { desc = "Grep current word" })
    vim.keymap.set("n", "<M-f>", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<M-d>", function()
      builtin.find_files({ find_command = { "fd", "--type", "d" } })
    end, { desc = "Find Directories" })
    vim.keymap.set("n", "<leader>ti", builtin.commands, { desc = "Help tags" })
    vim.keymap.set("n", "<leader>th", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
    vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "Active buffers" })
    vim.keymap.set("n", "<leader>.", builtin.oldfiles, { desc = "Find recent files" })

    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown({ winblend = 2, previewer = false }))
    end, { desc = "Search current buffer" })

    vim.keymap.set("n", "<leader>to", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "Live grep open files" })

    -- goto neovim config
    vim.keymap.set("n", "<leader>tc", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Neovim config" })
  end,
}
