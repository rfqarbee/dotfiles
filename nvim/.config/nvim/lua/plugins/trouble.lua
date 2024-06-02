return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/lsp-colors.nvim" },
	cmd = "Trouble",
	config = function()
		require("custom.trouble")
	end,
}
