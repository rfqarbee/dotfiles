local trouble = require("trouble")
local map = function(key, func, desc)
	vim.keymap.set("n", key, func, { desc = "Trouble : " .. desc })
end

trouble.setup({
	warn_no_results = true,
	win = {
		size = 55,
		position = "right",
	},
	modes = {
		todo = {
			desc = "Todo List",
			mode = "todo",
			win = { size = 35, position = "left" },
		},
		diagnostics = {
			desc = "Diagnostics",
			mode = "diagnostics",
			preview = {
				type = "split",
				relative = "win",
				position = "right",
				size = 0.5,
			},
			win = { position = "bottom", size = 10 },
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
		workspaceDiags = {
			mode = "diagnostics", -- inherit from diagnostics mode
			filter = {
				any = {
					buf = 0, -- current buffer
					{
						severity = vim.diagnostic.severity.ERROR, -- errors only
						-- limit to files in the current project
						function(item)
							return item.dirname:find((vim.loop or vim.uv).cwd(), 1, true)
						end,
					},
				},
			},
			preview = {
				type = "split",
				relative = "win",
				position = "right",
				size = 0.5,
			},
			win = { position = "bottom", size = 10 },
		},
		severefilter = {
			mode = "diagnostics", -- inherit from diagnostics mode
			desc = "Diagnostics on severity ",
			filter = function(items)
				local severity = vim.diagnostic.severity.HINT
				for _, item in ipairs(items) do
					severity = math.min(severity, item.severity)
				end
				return vim.tbl_filter(function(item)
					return item.severity == severity
				end, items)
			end,
			preview = {
				type = "split",
				relative = "win",
				position = "right",
				size = 0.5,
			},
			win = { position = "bottom", size = 10 },
		},
	},
})

-- keymaps
map("<leader>qc", "<cmd>Trouble severefilter toggle<cr>", "Workspace Cascade Diagnostics")
map("<leader>qd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Current Diagnostics")
map("<leader>qw", "<cmd>Trouble diagnostics toggle<cr> ", "Workspace Diagnostics")
map("<leader>qn", "<cmd>Trouble todo toggle<cr> ", "Todo list")
map("<leader>ql", "<cmd>Trouble loclist toggle<cr>", "Location list")
map("<leader>qq", "<cmd>Trouble qflist toggle<cr>", "Quickfix list")
map("<leader>qQ", "<cmd>Trouble quickfix toggle<cr>", "Quickfix list")
map("<leader>qt", "<cmd>Trouble telescope toggle<cr>", "Telescope Quickfix list")
--lsp
map("<leader>ls", "<cmdTrouble symbols toggle <cr>", "Document Symbols")
map("<leader>ls", "<cmd>Trouble lsp_document_symbols toggle <cr>", "Lsp Document Symbols")
map("<leader>ld", "<cmd>Trouble lsp_definitions toggle <cr>", "Lsp definition")
map("<leader>lD", "<cmd>Trouble lsp_declarations toggle <cr>", "Lsp declaration")
map("<leader>lt", "<cmd>Trouble lsp toggle win.position=right<cr>", "Lsp Defintion/references/....")

-- autocmd
local TroubleGroup = vim.api.nvim_create_augroup("TroubleGroup", { clear = true })

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	group = TroubleGroup,
	callback = function()
		vim.cmd([[Trouble qflist open]])
	end,
})
