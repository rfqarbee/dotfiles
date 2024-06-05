-- this is just to show file tree; i wont be using any of its functionality
return {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
	enabled = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local api = require("nvim-tree.api")
		require("nvim-tree").setup({
			view = {
				side = "right",
				width = 50,
			},
		})

		vim.keymap.set("n", "<space>fn", api.tree.toggle, { desc = "Toggle Nvim Tree" })
	end,
}
