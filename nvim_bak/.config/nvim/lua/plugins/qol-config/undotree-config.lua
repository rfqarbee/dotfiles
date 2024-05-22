return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("undotree").setup({
			float_diff = false,
			layout = "left_bottom",
			position = "right",
			-- this one could be useful i think
			ignore_filetype = {},
			-- window = {
			-- 	winblend = 30,
			-- 	width = 550,
			-- 	height = 550,
			-- },
		})
	end,
	keys = {
		{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
	},
}
