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
-- opt.colorcolumn = "80"
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

--TODO: another dotod
--WARN:
--FIX:
--PERF:
--NOTE:
--WARNING:
--
