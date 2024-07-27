local map = vim.keymap.set
-- unbind
map({ "n", "v" }, "Q", "<nop>")
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlight on search when Esc in normal mode" })

-- more binds
map("n", "<C-q>", "<cmd>qa<CR>", { desc = "Quit Neovim" })
map("n", "<M-q>", "<cmd>q<CR>", { desc = "Quit Buffer/window/tabs/anything" })
map("i", "jk", "<Esc>", { desc = "Insert to normal mode" })

map("n", "<C-s>", function()
  local filename = vim.fn.expand("%:t")
  -- HACK: aint the best way just to hide the notify, but its bothering with the autocmds i made
  local isModified = vim.bo.modified
  if isModified then
    vim.notify(filename, "info", {
      title = "File saved!",
      timeout = 3500,
    })
  end
  vim.cmd("silent w")
end, { desc = "Save file" })

-- navigating quickfix
map("n", "]q", "<cmd>cnext<cr>", { desc = "Next quickfix item" })
map("n", "[q", "<cmd>cprev<cr>", { desc = "Prev quickfix item" })

-- navigating buffers
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprev<cr>", { desc = "Prev Buffer" })

-- tabs
map("n", "<M-k>", "gt", { desc = "Next tab" })
map("n", "<M-j>", "gT", { desc = "Previous tab" })
map("n", "<leader>t.", "<cmd>+tabmove<cr>", { desc = "Move tab to right" })
map("n", "<leader>t,", "<cmd>-tabmove<cr>", { desc = "Move tab to left" })
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "Create new tab" })

map({ "n", "v" }, "L", "$", { desc = "End of line" })
map({ "n", "v" }, "H", "^", { desc = "Start of line" })

-- resize window; terminal doesnt register C-, (showkey -a)
map("n", "<M-,>", "<C-w>5>", { desc = "Shift left window size" })
map("n", "<M-.>", "<C-w>5<", { desc = "Shift right window size" })
map("n", "<M-->", "<C-w>2-", { desc = "Decrease window size" })
map("n", "<M-=>", "<C-w>2+", { desc = "Increase window size" })

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

-- replace current word
map("n", "<leader>rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current word" })
