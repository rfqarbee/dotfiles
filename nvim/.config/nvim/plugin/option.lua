--Set
local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1 -- disable netrw
vim.g.loaded_netrwPlugin = 1

opt.termguicolors = true
opt.guicursor = "n-v-c:block-nCursor,i-ci-ve:block-blinkwait300-blinkon50-blinkoff50,r-cr:hor20,o:hor50"
opt.mouse = "a" -- enable mouse all mode
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.showmode = false --disable show mode cuz status line already show
opt.cursorline = true
opt.breakindent = true --:h breakindent if u forgot what this is already
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true --highlight when searching
opt.incsearch = true
opt.signcolumn = "yes"
-- opt.colorcolumn = "80"
opt.splitright = true
opt.splitbelow = true

opt.list = true
opt.listchars = { tab = "▸ ", trail = ".", nbsp = "␣" }
opt.fillchars:append({ eob = " " })
opt.inccommand = "split"

opt.scrolloff = 5
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
--backup for undodir accessible by undotree
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
opt.isfname:append("@-@")
opt.updatetime = 100

--TODO: another dotod
--WARN:
--FIX:
--PERF:
--NOTE:
--WARNING:
--
