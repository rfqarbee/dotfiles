return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup {
            options = {
                --separator_style = "padded_slant",
                diagnostics = "nvim_lsp"
            }
        }
    end
}
