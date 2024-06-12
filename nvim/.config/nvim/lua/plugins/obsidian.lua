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
		opts = {
			workspaces = {
				{
					name = "Vaults",
					path = "~/Documents/Vaults",
				},
			},
			log_level = vim.log.levels.INFO,
			notes_subdir = "notes",
			completion = {
				-- Set to false to disable completion.
				nvim_cmp = true,
				-- Trigger completion at 2 chars.
				min_chars = 2,
			},
			mappings = {
				-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
				["gf"] = {
					action = function()
						return require("obsidian").util.gf_passthrough()
					end,
					opts = { noremap = false, expr = true, buffer = true },
				},
				-- Toggle check-boxes.
				["<leader>oc"] = {
					action = function()
						return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
				},
				-- Smart action depending on context, either follow link or toggle checkbox.
				["<cr>"] = {
					action = function()
						return require("obsidian").util.smart_action()
					end,
					opts = { buffer = true, expr = true },
				},
			},
			preferred_link_style = "wiki",
		},
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
			local defaultOS = "~/Documents/Vaults"

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
			-- end
		end,
		config = function()
			require("neo-tree").setup({
				enable_diagnostics = false,
				close_if_last_window = true,
				window = {
					position = "right",
					width = 45,
				},
				filesystem = {
					follow_current_file = {
						leave_dirs_open = true,
					},
				},
			})

			vim.keymap.set("n", "<leader>on", "<cmd>Neotree focus<cr>", { desc = "Switch to Tree" })
			-- -- open tree
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "*.md",
				callback = function()
					vim.cmd([[Neotree show]])
				end,
			})
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local neotree = vim.bo.filetype
					if neotree == "neo-tree" then
						-- local buf = vim.api.nvim_get_current_buf()
						-- vim.api.nvim_set_option_value("bufhidden", "wipe", tonumber(buf))
						vim.opt.number = false
						vim.opt.relativenumber = false
						-- vim.bo.readonly = false
						vim.bo.modifiable = true
					end
				end,
			})
		end,
	},
}
