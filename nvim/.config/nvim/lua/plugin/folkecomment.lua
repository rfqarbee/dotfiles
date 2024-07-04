return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- opts = {},
	config = function()
		require("todo-comments").setup({
			keywords = {
				FIX = {
					icon = " ",
					color = "error",
					alt = { "BUG", "ISSUE" },
				},
				TODO = { icon = " ", color = "info" },
				WARN = { icon = " ", color = "#ffbe3d", alt = { "WARNING", "TEMP" } },
				PERF = { icon = " ", color = "#5cfe97", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "#5ca5fe", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
		})
	end,
}

-- below is the color code and icons
-- NOTE:

-- TODO:

-- WARN:

-- FIX:

-- TEST:

-- OPTIMIZE:
