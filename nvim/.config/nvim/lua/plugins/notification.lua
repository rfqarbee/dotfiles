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

		-- test
		-- trying for when buffer save/error
		-- local result = {}
		-- vim.api.nvim_create_autocmd("BufWritePost", {
		-- 	group = vim.api.nvim_create_augroup("SavedBuffer", { clear = true }),
		-- 	pattern = "*",
		-- 	callback = function()
		-- 		result = {}
		-- 		local bufs = vim.api.nvim_list_bufs()
		-- 		local function split(str, delimiter) end
		--
		-- 		for _, bufnr in ipairs(bufs) do
		-- 			if vim.api.nvim_buf_get_option(bufnr, "modified") then
		-- 				vim.api.nvim_buf_call(bufnr, function()
		-- 					local filename = vim.api.nvim_buf_get_name(bufnr)
		-- 					table.insert(result, filename)
		-- 				end)
		-- 			end
		-- 		end
		-- 		-- 	for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
		-- 		-- 		table.insert(result, match)
		-- 		-- 	end
		-- 		-- 	return result
		-- 		-- end
		-- 		--
		-- 		-- local str = bufname
		-- 		-- local words = split(str, "/")
		-- 		-- local filename = words[#words]
		-- 		print("masuk tak")
		-- 		for _, fname in ipairs(result) do
		-- 			print(fname)
		-- 			-- vim.notify(fname, "info", { title = "test" })
		-- 		end
		-- 		-- vim.notify(result, "info", { title = "File Saved" })
		-- 	end,
		-- })

		local modified_buffers = {}
		-- Function to update the modified buffers list
		local function update_modified_buffers()
			local bufnr = vim.fn.bufnr()
			local bufname = vim.fn.bufname(bufnr)

			if vim.bo.modified then
				-- Add the buffer to the list if it's modified and not already in the list
				if not vim.tbl_contains(modified_buffers, bufname) then
					table.insert(modified_buffers, bufname)
				end
			else
				-- Remove the buffer from the list if it's not modified
				for i, name in ipairs(modified_buffers) do
					if name == bufname then
						table.remove(modified_buffers, i)
						break
					end
				end
			end
		end

		-- Autocommand to trigger on BufWritePost
		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				update_modified_buffers()
				vim.notify("Buffer written: " .. vim.fn.bufname(), "info", { title = "Buffer Update" })
			end,
		})

		-- Command to display all modified buffers
		vim.api.nvim_create_user_command("ShowModifiedBuffers", function()
			if #modified_buffers == 0 then
				vim.notify("No modified buffers", "info", { title = "Modified Buffers" })
			else
				vim.notify(
					"Modified buffers:\n" .. table.concat(modified_buffers, "\n"),
					"info",
					{ title = "Modified Buffers" }
				)
			end
		end, {})

		-- Ensure the initial list of modified buffers is correct
		vim.api.nvim_create_autocmd({ "BufEnter", "BufLeave", "BufWritePost", "BufReadPost" }, {
			callback = function()
				update_modified_buffers()
			end,
		})

		-- test
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
