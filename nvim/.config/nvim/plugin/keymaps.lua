local map = vim.keymap.set
--migrate this one soon, try use lazy keymaps
map("n", "<leader><leader>", vim.cmd.Ex)

map("i", "<C-c>", "<Esc>")
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight on search when Esc in normal mode" })

map("n", "zx", "<cmd>w<CR>")

map("i", "<C-k>", "<Up>", { desc = "Navigate in insert" })
map("i", "<C-j>", "<Down>", { desc = "Navigate in insert" })
map("i", "<C-h>", "<Left>", { desc = "Navigate in insert" })
map("i", "<C-l>", "<Right>", { desc = "Navigate in insert" })
map("i", "<C-x>", "<Bs>", { desc = "Delete 1 character in inside" })

--visual block to move around
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selected Line Below" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selected Line Below" })
--append line below to above, but cursor stays in place
map("n", "J", "mzJ`z")
--half page with cursor in middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

--search term but text in middle
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
--paste without override by next text
--yank into system clipboard instead of vim
map("x", "<leader>p", '"_dP', { desc = "Paste w/o Clipboard" })
map("n", "<leader>y", '"+y', { desc = "Yank into clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank . to end in clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank into clipboard (v)" })
map("n", "<leader>d", '"_d', { desc = "Delete w/o clipboard" })
map("v", "<leader>d", '"_d', { desc = "Delete w/o clipboard (v)" })
