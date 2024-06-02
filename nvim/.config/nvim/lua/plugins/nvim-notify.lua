return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	enabled = true,
	config = function()
		vim.notify = require("notify")
		vim.notify.setup({
			fps = 240,
			stages = "slide",
			timeout = 5000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		})
		require("custom.lsp-notif")
		--async example
		--[[
		local notify = require("notify").async
		local async = require("plenary.async")
		async.run(function()
			-- vim.system = require("notify")
			notify("test").events.close()
			notify("testafter")
		end)
		--]]
	end,
}
