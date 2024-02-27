return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        local w = require("which-key")
        w.register({
            ["<space>"] = "File Explore",
            f = { name = "Telescope" },
            u = { name = "undotree" },
            g = { name = "test" },
            t = {
                name = "Trouble : ",
                t = "Toggle Buffer",
                w = "Workspace Diagnostics",
                q = "Quickfix",
                d = "Document Diagnostics",
                l = "Loclist",
            },
            l = {
                name = "Lsp :",
                n = "Rename Buffer",
                w = "Workspace Folder",
                a = "Workspace Add",
                r = "Workspace Remove",
                l = "Workspace List",
                d = "Type Definition",
                c = "Code action",
            },
            w = "Window"
        }, { prefix = "<leader>" })
    end
}
