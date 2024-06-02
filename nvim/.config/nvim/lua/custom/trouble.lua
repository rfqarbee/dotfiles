local trouble = require("trouble")
local map = function(key, func, desc)
	vim.keymap.set("n", key, func, { desc = "Trouble : " .. desc })
end

trouble.setup({
	win = {
		type = "split",
		position = "left",
		size = 30,
	},
	modes = {
		cascade = {
			mode = "diagnostics", -- inherit from diagnostics mode
			filter = function(items)
				local severity = vim.diagnostic.severity.HINT
				for _, item in ipairs(items) do
					severity = math.min(severity, item.severity)
				end
				return vim.tbl_filter(function(item)
					return item.severity == severity
				end, items)
			end,
		},
	},
})

map("<leader>ld", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics")
map("<leader>lx", "<cmd>Trouble diagnostics toggle<cr> ", "Workspace Diagnostics")
map("<leader>ll", "<cmd>Trouble loclist toggle<cr>", "Location list")
map("<leader>lq", "<cmd>Trouble qflist toggle<cr>", "Quickfix list")
map("<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols")
map("<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "Lsp Defintion/references/....")

-- autocmd
local TroubleGroup = vim.api.nvim_create_augroup("TroubleGroup", { clear = true })
local OpenDiag = vim.api.nvim_create_augroup("OpenDiag", { clear = true })

vim.api.nvim_create_autocmd("BufRead", {
	group = OpenDiag,
	callback = function()
		vim.cmd([[Trouble diagnostics open filter.buf=0 auto_open=true]])
	end,
})

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	group = TroubleGroup,
	callback = function()
		vim.cmd([[Trouble qflist open]])
	end,
})
