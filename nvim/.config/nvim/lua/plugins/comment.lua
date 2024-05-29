return {
	"numToStr/Comment.nvim",
	lazy = false,
	enabled = false,
	config = function()
		local comment = require("Comment")
		comment.setup()
	end,
}
