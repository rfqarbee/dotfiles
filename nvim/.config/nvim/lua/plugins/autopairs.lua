return {
  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup({
          opts = {
            enable_close_on_slash = true,
          },
        })
      end,
    },
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
