local autocmd = vim.api.nvim_create_autocmd
local AuGroup = vim.api.nvim_create_augroup("replaceGroup", { clear = true })
local YankGroup = vim.api.nvim_create_augroup("HiglightYank", { clear = true })
local HelpVert = vim.api.nvim_create_augroup("HelpVert", { clear = true })
--something wrong with eslint_d
--local lintGroup = vim.api.nvim_create_augroup("lintGroup", { clear = true })

autocmd({ "BufWritePre" }, {
	desc = "Delete trailing whitespace",
	pattern = "*",
	group = AuGroup,
	command = [[%s/\s\+$//e]],
})

autocmd({ "BufEnter" }, {
	desc = "Help page to vertical split",
	group = HelpVert,
	callback = function()
		vim.cmd([[
						augroup HelpVert
						autocmd!
						autocmd FileType help wincmd L
						augroup END
			]])
	end,
})

--highlight text when copy
autocmd("TextYankPost", {
	desc = "Highlight when yank",
	group = YankGroup,
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 100,
		})
	end,
})

--linting
--[[
autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lintGroup,
	pattern = { "*.ts, *.js, *.tsx" },
	callback = function()
		require("lint").try_lint()
	end,
})
--]]
