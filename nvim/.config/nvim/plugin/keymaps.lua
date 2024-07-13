--test
local map = vim.keymap.set
-- might migrate to lazyvim; might not
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight on search when Esc in normal mode" })

-- source and execute
map({ "n", "v" }, "<leader>x", "<cmd>:source %<CR>", { desc = "Source & Execute" })

-- more binds
map("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit Neovim" })
-- map("n", "<leader>q", "<cmd>qa!<CR>", { desc = "Abort all and quit" })
map("i", "jk", "<Esc>", { desc = "Insert to normal mode" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- navigating tabs
map("n", "<M-j>", "gt")
map("n", "<M-k>", "gT")

-- insert navigation; kinda meh
-- map("i", "<C-k>", "<Up>", { desc = "Navigate in insert" })
-- map("i", "<C-j>", "<Down>", { desc = "Navigate in insert" })
-- map("i", "<C-h>", "<Left>", { desc = "Navigate in insert" })
-- map("i", "<C-l>", "<Right>", { desc = "Navigate in insert" })
-- map("i", "<C-x>", "<Bs>", { desc = "Delete 1 character in inside" })

-- resize window; terminal doesnt register C-, (showkey -a)
map("n", "<M-,>", "<C-w>5>", { desc = "Shift left window size" })
map("n", "<M-.>", "<C-w>5<", { desc = "Shift right window size" })
map("n", "<M-->", "<C-w>-", { desc = "Decrease window size" })
map("n", "<M-=>", "<C-w>+", { desc = "Increase window size" })
--visual block to move around
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selected Line Below" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selected Line Below" })
--append line below to above, but cursor stays in place
map("n", "J", "mzJ`z")
--half page with cursor in middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- cursor in middle
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "p", '"_dP', { desc = "Paste w/o Clipboard" })
map("x", "<leader>p", '"+p', { desc = "Paste and copy into Clipboard" })
-- map({"n","v"}, "d", '"_d', { desc = "Delete w/o clipboard" })
-- map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete w/o clipboard (v)" })
