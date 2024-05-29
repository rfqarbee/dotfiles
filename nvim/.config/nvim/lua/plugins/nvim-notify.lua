return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		vim.notify = require("notify")
		vim.notify.setup({
			fps = 240,
			stages = "slide",
			timeout = 3000,
		})

		require("custom.notify")
	end,
}
