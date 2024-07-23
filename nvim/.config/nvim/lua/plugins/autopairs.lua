return {
  -- nvim-ts autotag
  {
    "windwp/nvim-ts-autotag",
    enabled = true,
    events = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      })
    end,
  },
  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
      local autopairs = require("nvim-autopairs")

      autopairs.setup({
        check_ts = true, -- check treesitter
        ts_config = {
          lua = { "string" },
          javascript = { "template_string" },
          java = false,
        },
      })
    end,
  },
}
