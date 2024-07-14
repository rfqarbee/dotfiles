return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 1000,
    -- event = {"InsertEnter","CmdlineEnter"},
    dependencies = {
      "onsails/lspkind.nvim", -- completion icons
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        build = (function()
          if vim.fn.executable("make") == 0 then
            return
          end
          return "make install_jsregexp"
        end)(),
      },
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local luasnip = require("luasnip")
      local autopairs = require("nvim-autopairs.completion.cmp")
      -- local ts_utils = require("nvim-treesitter.ts_utils")
      local lspkind = require("lspkind")
      local cmp = require("cmp")

      luasnip.config.setup({})
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            -- border = { "", "", "", ">", "", "", "", "<" },
            border = "single",
          }),
          documentation = cmp.config.window.bordered({
            border = "single",
          }),
        },
        view = {
          entries = {
            name = "custom",
            -- selection_order = "near_cursor",
            follow_cursor = false,
          },
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            show_labelDetails = true,
            menu = {
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
            },
          }),
        },
        completion = { completeopt = "menu,menuone,noinsert" },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete({}),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-5),
          ["<C-d>"] = cmp.mapping.scroll_docs(5),
          ["<C-f>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  behavior = cmp.ConfirmBehavior.Insert,
                  select = true,
                })
              end
            else
              fallback()
            end
          end, { "i", "s", "c" }),
          ["<C-k>"] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-j>"] = cmp.mapping(function(fallback)
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp", group_index = 0 },
          { name = "luasnip", group_index = 2 },
          { name = "path", group_index = 3 },
          { name = "buffer" },
        }),
      })

      -- cmdline
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "cmdline" },
          { name = "path" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.event:on("confirm_done", autopairs.on_confirm_done())

      -- vscode color scheme
      -- gray
      vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
      -- blue
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
      -- light blue
      vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
      vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
      vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
      -- pink
      vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
      vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
      -- front
      vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
      vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
      vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })
    end,
  },
}
