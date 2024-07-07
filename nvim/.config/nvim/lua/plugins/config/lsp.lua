return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- mason lsp and shit
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      local capabilities = nil

      if pcall(require, "cmp_nvim_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end

      local lspconfig = require("lspconfig")

      local servers = {
        rust_analyzer = true,
        svelte = {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            client.notify("$/onDidChangeTsorJsFile", { uri = ctx.match })
          end,
        },
        cssls = true,
        graphql = {
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        },
        clangd = {
          init_options = { clangdFileStatus = true },
          filetypes = { "c" },
        },
        -- tsserver = true,
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = { globals = { "vim" } },
            },
          },
        },
      }

      local servers_to_install = vim.tbl_filter(function(key)
        local t = servers[key]
        if type(t) == "table" then
          return not t.manual_install
        else
          return t
        end
      end, vim.tbl_keys(servers))

      require("mason").setup()
      local ensure_installed = {
        "lua_ls",
        "clangd",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "graphql",
        "prettierd",
        "prettier",
        "stylua",
        "cpplint",
        "eslint_d",
      }

      vim.list_extend(ensure_installed, servers_to_install)
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end
        config = vim.tbl_deep_extend("force", {}, {
          capabilities = capabilities,
        }, config)

        lspconfig[name].setup(config)
      end

      local disable_semantic_tokens = {
        lua = true,
      }

      -- lsp
      vim.api.nvim_create_autocmd({ "LspAttach" }, {
        group = vim.api.nvim_create_augroup("neovim-lsp-group", { clear = true }),
        callback = function(event)
          local bufnr = event.buf
          local client = assert(vim.lsp.get_client_by_id(event.data.client_id), "must have valid client")
          local builtin = require("telescope.builtin")
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
          end

          -- using telescope
          map("gd", builtin.lsp_definitions, "Goto defintion")
          map("gD", vim.lsp.buf.declaration, "Goto declaration")
          map("gr", builtin.lsp_references, "Goto references")
          map("gi", builtin.lsp_implementations, "Goto implementation")
          map("<leader>cd", builtin.lsp_type_definitions, "Type definition")
          map("<leader>cs", builtin.lsp_document_symbols, "Document symbols")
          map("<leader>cw", builtin.lsp_dynamic_workspace_symbols, "Workspace symbols")
          map("<leader>rn", vim.lsp.buf.rename, "Rename var")
          map("<C-p>", vim.lsp.buf.code_action, "Code action")
          map("<C-n>", vim.diagnostic.open_float, "Diagnostics open float")
          map("<leader>lr", "<cmd>LspRestart<cr>", "Restart")

          -- i aint reading allat, one day customize maybe, for now its good enough
          local filetype = vim.bo[bufnr].filetype
          if disable_semantic_tokens[filetype] then
            client.server_capabilities.semanticTokensProvider = nil
          end

          -- comment this out first
          -- local client = vim.lsp.get_client_by_id(event.data.client_id)
          -- if client and client.server_capabilities.documentHighlightProvider then
          -- 	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          -- 		buffer = bufnr,
          -- 		callback = vim.lsp.buf.document_highlight,
          -- 	})
          --
          -- 	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          -- 		buffer = bufnr,
          -- 		callback = vim.lsp.buf.clear_references,
          -- 	})
          -- end
        end,
      })
    end,
  },
  -- typescript specific
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup({
        settings = {
          publish_diagnostic_on = "insert_leave",
        },
      })
    end,
  },
}
