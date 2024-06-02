-- personal autocmd
local autocmd = vim.api.nvim_create_autocmd
local WhiteSpace = vim.api.nvim_create_augroup("replaceGroup", { clear = true })
local YankGroup = vim.api.nvim_create_augroup("HiglightYank", { clear = true })
local Helpvert = vim.api.nvim_create_augroup("HelpVert", { clear = true })
local SaveAll = vim.api.nvim_create_augroup("SaveAll", { clear = true })

--something wrong with eslint_d
--local lintGroup = vim.api.nvim_create_augroup("lintGroup", { clear = true })

-- save all opened buffers that has changes
autocmd("BufWritePost", {
	group = SaveAll,
	pattern = "*",
	callback = function()
		-- get all buffers
		local bufs = vim.api.nvim_list_bufs()

		for _, bufnr in ipairs(bufs) do
			if vim.api.nvim_buf_get_option(bufnr, "modified") then
				vim.api.nvim_buf_call(bufnr, function()
					vim.cmd("write")
				end)
			end
		end
	end,
})

autocmd("BufWritePre", {
	desc = "Delete trailing whitespace",
	pattern = "*",
	group = WhiteSpace,
	command = [[%s/\s\+$//e]],
})
-- :help to vsplit
autocmd("BufEnter", {
	desc = "Split Vertical for help files",
	group = Helpvert,
	callback = function()
		vim.cmd([[
		   augroup Helpvert
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
			timeout = 50,
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
