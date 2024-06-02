-- nvim 0.10.0 has default comments
return {
	"numToStr/Comment.nvim",
	lazy = false,
	enabled = false,
	config = function()
		local comment = require("Comment")
		comment.setup()
	end,
}
