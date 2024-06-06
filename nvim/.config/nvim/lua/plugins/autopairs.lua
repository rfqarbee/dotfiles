return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		require("custom.autopairs")
	end,
}
