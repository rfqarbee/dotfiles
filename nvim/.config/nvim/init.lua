vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
		-- {
		-- 	"folke/tokyonight.nvim",
		-- 	lazy = false,
		-- 	priority = 1000,
		-- 	config = function()
		-- 		require("tokyonight").setup({
		-- 			style = "moon",
		-- 			transparent = true,
		-- 		})
		-- 		vim.cmd.colorscheme("tokyonight-storm")
		-- 	end,
		-- },
		{
			"catppuccin/nvim",
			name = "catppuccin",
			lazy = false,
			priority = 1000,
			config = function()
				require("catppuccin").setup({
					flavour = "macchiato",
					transparent_background = true,
					show_end_of_buffer = true,
				})
				vim.cmd.colorscheme("catppuccin-macchiato")
			end,
		},
		{ import = "plugins" },
	},
})
