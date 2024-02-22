local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        {"ThePrimeagen/vim-be-good"},
        {
            "catppuccin/nvim",
            name = "catppuccin",
            lazy = false,
            priority = 1000,
            config = function()
                require("catppuccin").setup()
                vim.cmd.colorscheme "catppuccin-macchiato"
            end
        },
        { import = "plugins.tmuxnav-config"},
        { import = "plugins.fidget-config" },
        { import = "plugins.lsp-config" },
        { import = "plugins.lualine-config" },
        { import = "plugins.bufferline-config" },
        --{import = "plugins.nvimtree-config"},
        { import = "plugins.trouble-config" },
        { import = "plugins.telescope-config" },
        { import = "plugins.harpoon-config" },
        { import = "plugins.whichkey-config" },
        { import = "plugins.treesitter-config" },
        { import = "plugins.undotree-config" },
    }
})
