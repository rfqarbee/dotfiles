local map = vim.keymap.set
--migrate this one soon, try use lazy keymaps
map("n", "<leader><leader>", vim.cmd.Ex)

--not sure i prefer jk or Ctrl+c or even kj
map("i", "<C-c>", "<Esc>")
--map("i", "<C-c>", "<Esc>")

--remapped for :w and :update
map("n", "<C-q>","<cmd>:q<CR>")
map("n",  "zx","<cmd>w<CR>")

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
map("x", "<leader>p", "\"_dP", { desc = "Paste w/o Clipboard" })

--yank into system clipboard instead of vim
map("n", "<leader>y", "\"+y", { desc = "Yank into clipboard" })
map("n", "<leader>Y", "\"+Y", { desc = "Yank . to end in clipboard" })
map("v", "<leader>y", "\"+y", { desc = "Yank into clipboard (v)" })

--delete into void without cutting into clipboard
map("n", "<leader>d", "\"_d", { desc = "Delete w/o clipboard" })
map("v", "<leader>d", "\"_d", { desc = "Delete w/o clipboard (v)" })

--remap tabs and windows
map("n", "<leader>ww", "<C-w>w", {desc = "Switch Window"})
map("n", "<leader>wv", "<C-w>v", {desc = "Split Vertical Window"})
map("n", "<leader>ws", "<C-w>s", {desc = "Split Horizontal Window"})
map("n", "<leader>wq", "<C-w>q", {desc = "Quit Window"})
map("n","<S-Tab>", "<cmd>bprev<CR>", {desc = "Previous Tab"})
map("n","<Tab>", "<cmd>bnext<CR>", {desc = "Next Tab"})
map("n","<leader>q", "<cmd>bd<CR>", {desc = "Quit Tab"})

--TODO - look up for this
--ig doesnt work anymore? idk
--switch project from vim, got it from theprimeagen
--map("n","<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
