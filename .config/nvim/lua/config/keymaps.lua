local map = vim.keymap.set
--migrate this one soon, try use lazy keymaps
map("n", "<leader><leader>", vim.cmd.Ex)

--escape key
map("i", "jk", "<Esc>")

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight on search when Esc in normal mode" })
--remapped for :w and :update
map("n", "<C-q>", "<cmd>:q<CR>")
map("n", "zx", "<cmd>w<CR>")

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

--Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>e", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

--navigating window
map("n", "<C-M>h", "<C-w><C-h>", { desc = "Move to left window" })
map("n", "<C-M>j", "<C-w><C-j>", { desc = "Move to lower window" })
map("n", "<C-M>k", "<C-w><C-k>", { desc = "Move to upper window" })
map("n", "<C-M>l", "<C-w><C-l>", { desc = "Move to right window" })

--paste without override by next text
map("x", "<leader>p", '"_dP', { desc = "Paste w/o Clipboard" })

--yank into system clipboard instead of vim
map("n", "<leader>y", '"+y', { desc = "Yank into clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank . to end in clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank into clipboard (v)" })

--delete into void without cutting into clipboard
map("n", "<leader>d", '"_d', { desc = "Delete w/o clipboard" })
map("v", "<leader>d", '"_d', { desc = "Delete w/o clipboard (v)" })

--remap tabs and windows
map("n", "<leader>ww", "<C-w>w", { desc = "Switch Window" })
-- map("n", "<leader>wv", "<C-w>v", { desc = "Split Vertical Window" })
-- map("n", "<leader>ws", "<C-w>s", { desc = "Split Horizontal Window" })
map("n", "<leader>wq", "<C-w>q", { desc = "Quit Window" })
-- map("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "Previous Tab" })
-- map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next Tab" })
map("n", "<leader>bq", "<cmd>bd<CR>", { desc = "Quit Tab" })

--TODO - look up for this
--ig doesnt work anymore? idk
--switch project from vim, got it from theprimeagen
--map("n","<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
