return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/lsp-colors.nvim" },
	config = function()
		require("custom.trouble")
	end,
}
