return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- mason lsp and shit
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- autoformat
		"stevearc/conform.nvim",
		-- notif
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		local capabilities = nil
		if pcall(require, "cmp_nvim_lsp") then
			capabilities = require("cmp_nvim_lsp").default_capabilities()
		end

		local lspconfig = require("lspconfig")

		local servers = {
			bashls = true,
			rust_analyzer = true,
			svelte = true,
			cssls = true,
			clangd = {
				init_options = { clangdFileStatus = true },
				filetypes = { "c" },
			},
			tsserver = true,
			lua_ls = true,
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
			"stylua",
			"lua_ls",
			"clangd",
		}

		vim.list_extend(ensure_installed, servers_to_install)
		require("mason-tool-installer").setup({ ensure_installe = ensure_installed })

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

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("neovim-lsp-group", { clear = true }),
			callback = function(event)
				local bufnr = event.buf
				local client = assert(vim.lsp.get_client_by_id(event.data.client_id), "must have valid client")
				local builtin = require("telescope.builtin")

				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- using telescope
				-- map("gd", builtin.lsp_definitions, "Goto defintion")
				-- map("gr", builtin.lsp_references, "Goto references")
				-- map("gI", builtin.lsp_implementations, "Goto implementation")
				-- map("<leader>cs", builtin.lsp_document_symbols, "Document symbols")
				-- map("<leader>cw", builtin.lsp_dynamic_workspace_symbols, "Workspace symbols")
				-- map("<leader>D", builtin.lsp_type_definitions, "Type definition")

				-- default vim lsp
				map("<leader>D", vim.lsp.buf, "Type definition")
				map("gd", vim.lsp.buf.definition, "Goto defintion")
				map("gD", vim.lsp.buf.declaration, "Goto declaration")
				map("gr", vim.lsp.buf.references, "Goto references")

				-- map("gI", vim.lsp.buf, "Goto implementation")
				-- map("<leader>cs", vim.lsp.buf, "Document symbols")
				-- map("<leader>cw", vim.lsp.buf, "Workspace symbols")
				map("<leader>cn", vim.lsp.buf.rename, "Rename var")
				map("<leader>ca", vim.lsp.buf.code_action, "Code action")
				--
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

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("test", { clear = true }),
			callback = function(args)
				require("conform").format({
					bufnr = args.buf,
					lsp_fallback = true,
					quiet = true,
				})
			end,
		})
	end,
}
