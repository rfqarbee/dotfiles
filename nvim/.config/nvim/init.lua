vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = 'powershell.exe -c [Console]::Out.write($(Get-Clipboard -Raw).tostring().replace("`r",""))',
    ["*"] = 'powershell.exe -c [Console]::Out.write($(Get-Clipboard -Raw).tostring().replace("`r",""))',
  },
  cache_enabled = 0,
}

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

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.config" },
    { import = "plugins.lsp" },
    { import = "plugins.ui" },
  },
  change_detection = { notify = false },
  checker = {
    enabled = true,
  },
})
