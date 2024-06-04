local trouble = require("trouble")
local map = function(key, func, desc)
	vim.keymap.set("n", key, func, { desc = "Trouble : " .. desc })
end

trouble.setup({
	warn_no_results = true,
	-- win = {
	-- 	type = "split",
	-- 	position = "left",
	-- 	size = 30,
	-- },
	modes = {
		todo = {
			desc = "Todo List",
			mode = "todo",
			win = { size = 35, position = "left" },
		},
		diagnostics = {
			desc = "Diagnostics",
			mode = "diagnostics",
			win = { position = "bottom", size = 15 },
		},
		quickfix = {
			desc = "Quickfix list",
			mode = "quickfix",
			win = { position = "left", size = 35 },
		},
		qflist = {
			desc = "Quickfix list",
			mode = "qflist",
			win = { position = "left", size = 35 },
		},
		telescope = {
			desc = "Telescope Quickfix list",
			mode = "telescope",
			win = { position = "left", size = 35 },
		},
		loclist = {
			desc = "Location list",
			mode = "loclist",
			win = { position = "right" },
		},
		cascade = {
			mode = "diagnostics", -- inherit from diagnostics mode
			desc = "Diagnostics (Cascade mode)",
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

-- keymaps
map("<leader>qc", "<cmd>Trouble cascade toggle<cr>", "Workspace Cascade Diagnostics")
map("<leader>qd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Current Diagnostics")
map("<leader>qx", "<cmd>Trouble diagnostics toggle<cr> ", "Workspace Diagnostics")
map("<leader>qn", "<cmd>Trouble todo toggle<cr> ", "Todo list")
map("<leader>ql", "<cmd>Trouble loclist toggle<cr>", "Location list")
map("<leader>qq", "<cmd>Trouble qflist toggle<cr>", "Quickfix list")
map("<leader>qQ", "<cmd>Trouble quickfix toggle<cr>", "Quickfix list")
map("<leader>qt", "<cmd>Trouble telescope toggle<cr>", "Telescope Quickfix list")
map("<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols")
map("<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "Lsp Defintion/references/....")

-- autocmd
local TroubleGroup = vim.api.nvim_create_augroup("TroubleGroup", { clear = true })
local OpenDiag = vim.api.nvim_create_augroup("OpenDiag", { clear = true })

-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	-- group = OpenDiag,
-- 	callback = function()
-- 		vim.cmd([[Trouble diagnostics open filter.buf=0 auto_open=true]])
-- 	end,
-- })

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	-- group = TroubleGroup,
	callback = function()
		vim.cmd([[Trouble qflist open]])
	end,
})
