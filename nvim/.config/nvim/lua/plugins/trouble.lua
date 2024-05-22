return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/lsp-colors.nvim" },
	config = function()
		require("custom.trouble")
	end,
}
