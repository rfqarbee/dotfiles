--Set
local opt = vim.opt
vim.opt.termguicolors = true
vim.g.mapleader = " "
--vim key opts
opt.guicursor = "n-v-c:block-nCursor,i-ci-ve:block-blinkwait300-blinkon50-blinkoff50,r-cr:hor20,o:hor50"

opt.number = true
opt.relativenumber = true
opt.colorcolumn = "80"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

--backup for undodir accessible by undotree
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 50

--Declare global leader key here

local autocmd = vim.api.nvim_create_autocmd
local AuGroup = vim.api.nvim_create_augroup("rfqGroup", { clear = true })
local WinGroup = vim.api.nvim_create_augroup("WinGroup", { clear = true })
local YankGroup = vim.api.nvim_create_augroup("HiglightYank", {})
--something wrong with eslint_d
--local lintGroup = vim.api.nvim_create_augroup("lintGroup", { clear = true })

--test for win split
autocmd({ "WinNew" }, {
	group = WinGroup,
	pattern = "*",
	callback = function()
		if not (vim.bo.filetype == "undotree") then
			vim.cmd("wincmd L")
		end
	end,
})

--delete trailing whitespace
autocmd({ "BufWritePre" }, {
	group = AuGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

--highlight text when copy
autocmd("TextYankPost", {
	group = YankGroup,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

--linting
--[[
autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lintGroup,
	pattern = { "*.ts, *.js, *.tsx, *.c" },
	callback = function()
		require("lint").try_lint()
	end,
})
--]]

--lsp config
autocmd("LspAttach", {
	group = AuGroup,
	callback = function(env)
		local opts = { buffer = env.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>ll", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>ld", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>lc", vim.lsp.buf.code_action, opts)
		--vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		--[[
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
        --]]
	end,
})
