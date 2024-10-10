vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- setup colorscheme
vim.cmd("colorscheme doom_one") -- i'll use mine after im done actually creating the colorscheme

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

if vim.g.neovide then
  vim.cmd[[cd ~/Documents/IFCA/contract-root]]
  vim.cmd[[let &shell='"C:\Program Files\Git\bin\bash.exe" -f']]
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
  vim.g.neovide_position_animation_length = 0
  vim.g.neovide_scroll_animation_length = 0
  vim.g.neovide_scroll_animation_far_lines = 0
  vim.g.neovide_fullscreen = false
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_command_line = false
end

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.config" },
    { import = "plugins.lsp" },
    { import = "plugins.ui" },
  },
  change_detection = { notify = false },
  checker = {
    enabled = false,
  },
})
