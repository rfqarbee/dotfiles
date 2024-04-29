local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		--Direct plugins
		{ "ThePrimeagen/vim-be-good" },
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				require("tokyonight").setup({
					style = "moon",
					transparent = true,
				})
				vim.cmd.colorscheme("tokyonight-storm")
			end,
		},
		-- {
		-- 	"catppuccin/nvim",
		-- 	name = "catppuccin",
		-- 	lazy = false,
		-- 	priority = 1000,
		-- 	config = function()
		-- 		require("catppuccin").setup({
		-- 			flavour = "mocha",
		-- 			transparent_background = true,
		-- 			show_end_of_buffer = true,
		-- 		})
		-- 		vim.cmd.colorscheme("catppuccin-mocha")
		-- 	end,
		-- },

		{ import = "plugins.tmuxnav-config" },
		{ import = "plugins.lsp-config" },
		{ import = "plugins.qol-config" },
		{ import = "plugins.ui-config" },
	},
})
