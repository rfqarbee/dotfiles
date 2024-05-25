--Set
local opt = vim.opt
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--vim key opts
opt.guicursor = "n-v-c:block-nCursor,i-ci-ve:block-blinkwait300-blinkon50-blinkoff50,r-cr:hor20,o:hor50"

opt.number = true
opt.relativenumber = true

opt.mouse = "a" --useful if wanting to resizing splits

opt.showmode = false --disable show mode cuz status line already show
opt.breakindent = true --:h breakindent if u forgot what this is already
opt.wrap = false

--case insensitive unless \C or capital in search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true --highlight when searching
opt.incsearch = true

opt.signcolumn = "yes"

opt.splitright = true
opt.splitbelow = true
opt.list = true
opt.listchars = { tab = "- ", trail = ".", nbsp = "␣" }

opt.inccommand = "split"

opt.cursorline = true

opt.scrolloff = 7
opt.colorcolumn = "80"
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

--backup for undodir accessible by undotree
opt.swapfile = false
opt.backup = false
--im too lazy to make a function for this
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
--for windows
--opt.undodir = os.getenv("HOME") .. "AppData/Local/nvim/undodir"
opt.undofile = true

opt.termguicolors = true
opt.isfname:append("@-@")
opt.updatetime = 100

local autocmd = vim.api.nvim_create_autocmd
local AuGroup = vim.api.nvim_create_augroup("replaceGroup", { clear = true })
local YankGroup = vim.api.nvim_create_augroup("HiglightYank", { clear = true })
--something wrong with eslint_d
--local lintGroup = vim.api.nvim_create_augroup("lintGroup", { clear = true })

autocmd({ "BufWritePre" }, {
	desc = "Delete trailing whitespace",
	pattern = "*",
	group = AuGroup,
	command = [[%s/\s\+$//e]],
})

--highlight text when copy
autocmd("TextYankPost", {
	desc = "Highlight when yank",
	group = YankGroup,
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 100,
		})
	end,
})

--linting
--[[
autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lintGroup,
	pattern = { "*.ts, *.js, *.tsx" },
	callback = function()
		require("lint").try_lint()
	end,
})
--]]
--TODO: change keymaps
--lsp config
-- autocmd("LspAttach", {
-- 	group = AuGroup,
-- 	callback = function(env)
-- 		local opts = { buffer = env.buf }
-- 		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
-- 		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- 		vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, opts)
-- 		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
-- 		vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)
-- 		vim.keymap.set("n", "<leader>la", vim.lsp.buf.add_workspace_folder, opts)
-- 		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.remove_workspace_folder, opts)
-- 		vim.keymap.set("n", "<leader>ll", function()
-- 			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- 		end, opts)
-- 		vim.keymap.set("n", "<leader>ld", vim.lsp.buf.type_definition, opts)
-- 		vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts)
-- 		vim.keymap.set({ "n", "v" }, "<leader>lc", vim.lsp.buf.code_action, opts)
-- 		--vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
-- 		--[[
-- 		vim.keymap.set("n", "<leader>f", function()
-- 			vim.lsp.buf.format({ async = true })
-- 		end, opts)
--
--         --]]
-- 	end,
-- })

--TODO: another dotod
--WARN:
--FIX:
--PERF:
--NOTE:
--WARNING:
--
