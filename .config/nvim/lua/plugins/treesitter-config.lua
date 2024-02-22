return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

        })
    end
}
