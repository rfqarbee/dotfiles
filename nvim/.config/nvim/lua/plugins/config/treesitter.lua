return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = { "nvim-treesitter/nvim-treesitter-context", opts = {} },
  config = function()
    local ensure_installed = {
      "json5",
      "json",
      "typescript",
      "javascript",
      "html",
      "css",
      "tsx",
      "svelte",
      "prisma",

      "bash",

      "c",
      "c_sharp",
      "make",
      "cmake",

      "dart",

      "go",

      "sql",
      "query",
      "http",

      "regex",

      "gitignore",
      "dockerfile",

      "graphql",
      "toml",
      "yaml",

      "lua",
      "luadoc",
      "vim",
      "vimdoc",

      "rust",

      "markdown_inline",
      "markdown",
    }

    require("nvim-treesitter.configs").setup({

      ensure_installed = ensure_installed,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    })

    vim.keymap.set("n", "[c", function()
      require("treesitter-context").go_to_context(vim.v.count1)
    end, { silent = true, desc = "Move to next context" })
  end,
}
