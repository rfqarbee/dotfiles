return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        require('undotree').setup({
            float_diff = false,
            layout = "left_bottom",
            position = 'right',
            -- this one could be useful i think
            ignore_filetype = {}

        })
    end,
    keys = { -- load the plugin only when using it's keybinding:
        { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
}
