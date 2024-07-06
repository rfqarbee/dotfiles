return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
			-- see below for full list of optional dependencies 👇
		},
		cond = function()
			local getos = os.getenv("OS")
			local windowPath = "C:\\Users\\muhammadrafiq\\Documents\\Vaults"
			local defaultOS = "/home/rafiq/Documents/Vaults"

			-- this is only for my work laptop
			if getos ~= nil and string.find(getos:lower(), "windows") then
				if vim.fn.getcwd() == windowPath then
					return true
				end
			else
				if vim.fn.getcwd() == defaultOS then
					return true
				end
			end
		end,
		config = function()
			require("custom.obsidian")
		end,
	},
	-- display on obsidian vaults
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		Event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		cond = function()
			local getos = os.getenv("OS")
			local windowPath = "C:\\Users\\muhammadrafiq\\Documents\\Vaults"
			local defaultOS = "/home/rafiq/Documents/Vaults"

			-- this is only for my work laptop
			if getos ~= nil and string.find(getos:lower(), "windows") then
				if vim.fn.getcwd() == windowPath then
					return true
				end
			else
				if vim.fn.getcwd() == defaultOS then
					return true
				end
			end
		end,
		config = function()
			require("custom.neotree")
		end,
	},
}
