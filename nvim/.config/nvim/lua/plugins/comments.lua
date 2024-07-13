return {
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
}
