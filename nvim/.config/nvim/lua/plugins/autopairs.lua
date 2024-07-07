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
          enable_close_on_slash = false,
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
      local Rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")

      autopairs.setup({
        check_ts = true,
        ts_config = {
          lua = { "string" },
          javascript = { "template_string" },
          java = false,
        },
      })
      -- auto space on :
      -- autopairs.add_rule(Rule(":", "")
      -- 	:with_pair(function(opts)
      -- 		local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
      -- 		if last_char:match("[%w%=%s]") then
      -- 			return true
      -- 		end
      -- 		return false
      -- 	end)
      -- 	:replace_endpair(function(opts)
      -- 		local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
      -- 		local next_char = opts.line:sub(opts.col, opts.col)
      -- 		next_char = next_char == " " and "" or " "
      -- 		if prev_2char:match("%w$") then
      -- 			return "<bs> :" .. next_char
      -- 		end
      -- 		if prev_2char:match("%:$") then
      -- 			return next_char
      -- 		end
      -- 		if prev_2char:match(":") then
      -- 			return "<bs><bs>=" .. next_char
      -- 		end
      -- 		return ""
      -- 	end)
      -- 	:set_end_pair_length(0)
      -- 	:with_move(cond.none())
      -- 	:with_del(cond.none()))
    end,
  },
}
