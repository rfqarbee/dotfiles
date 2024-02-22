local wk = {}

function run(w)
    w.register({
        f = { name = "telescope" },
        u = { name = "undotree" },
        g = { name = "test" },
    }, { prefix = "<leader>" })
end

return WK
