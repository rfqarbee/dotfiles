return {
	"numToStr/Comment.nvim",
	enabled = true,
	opts = {},
	lazy = false,
	config = function()
		local comment = require("Comment")
		comment.setup()
	end,
}
