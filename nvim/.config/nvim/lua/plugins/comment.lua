return {
	"numToStr/Comment.nvim",
	enabled = true,
	opts = {},
	lazy = false,
	enabled = false,
	config = function()
		local comment = require("Comment")
		comment.setup()
	end,
}
