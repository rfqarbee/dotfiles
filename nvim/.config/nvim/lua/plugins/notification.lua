return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	enabled = true,
	config = function()
		local notify = require("notify")
		local messages = {}

		vim.notify = notify
		notify.setup({
			fps = 240,
			stages = "slide",
			timeout = 5000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		})

		-- NOTE: custom function for lsp notification (WIP)
		require("custom.lsp-notif")

		-- trying for when buffer save/error
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = vim.api.nvim_create_augroup("SaveBuffer", { clear = true }),
			pattern = "*",
			callback = function()
				local bufname = vim.fn.expand("%:p")

				local function split(str, delimiter)
					local result = {}
					for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
						table.insert(result, match)
					end
					return result
				end

				local str = bufname
				local words = split(str, "/")
				local filename = words[#words]
				vim.notify(filename, "info", { title = "File Saved" })
			end,
		})

		local function command_output(cmd)
			vim.cmd("redir => g:_command_output | silent " .. cmd .. " | redir END ")
			local output = vim.g._command_output
			vim.g._command_output = nil
			return output
		end

		vim.notify(command_output("pwd"))
		--async example
		--[[
		local notify = require("notify").async
		local async = require("plenary.async")
		async.run(function()
			-- vim.system = require("notify")
			notify("test").events.close()
			notify("testafter")
		end)
		--]]
	end,
}
