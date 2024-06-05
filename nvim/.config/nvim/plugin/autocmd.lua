-- personal autocmd
local autocmd = vim.api.nvim_create_autocmd
local AuGroup = vim.api.nvim_create_augroup("replaceGroup", { clear = true })
local YankGroup = vim.api.nvim_create_augroup("HiglightYank", { clear = true })
local Helpvert = vim.api.nvim_create_augroup("HelpVert", { clear = true })
local SaveAll = vim.api.nvim_create_augroup("SaveAll", { clear = true })

--something wrong with eslint_d
--local lintGroup = vim.api.nvim_create_augroup("lintGroup", { clear = true })

-- save all opened buffers that has changes and notify files saved
autocmd("BufWritePost", {
	group = SaveAll,
	pattern = "*",
	callback = function()
		local buflist = {}
		local bufnum = {}
		local buffer = vim.api.nvim_cmd({ cmd = "buffers" }, { output = true })
		local pwd = vim.api.nvim_cmd({ cmd = "pwd" }, { output = true })
		local name = pwd:match("([^/]+)$")

		--get substring
		local function getstr(fullpath)
			local path = fullpath:gsub("^" .. pwd .. "/", "")
			local function relative_path(key)
				local parts = {}
				local result = {}
				-- arrays of string
				for part in string.gmatch(key, "([^/]+)") do
					table.insert(parts, part)
				end
				if #parts > 1 then
					for _ = 1, (#parts - 2) do
						table.insert(result, "..")
					end
					table.insert(result, table.concat(parts, "/", #parts - 1, #parts))
				else
					return key
				end
				return table.concat(result, "/")
			end
			return name .. "/" .. relative_path(path)
		end
		-- get all line
		for line in buffer:gmatch("[^\r\n]+") do
			table.insert(buflist, line)
		end
		-- only store buffer number
		for _, line in ipairs(buflist) do
			local getNum = line:match("^%s*(%d+)")
			if getNum then
				table.insert(bufnum, getNum)
			end
		end
		-- save for buffers that has changes and notify
		for _, bufnr in ipairs(bufnum) do
			if vim.api.nvim_get_option_value("modified", { buf = tonumber(bufnr) }) then
				local savedFiles = vim.api.nvim_buf_get_name(tonumber(bufnr))
				vim.notify(getstr(savedFiles), "info", {
					title = "File saved!",
					timeout = 4500,
				})
				vim.api.nvim_buf_call(tonumber(bufnr), function()
					vim.cmd("write")
				end)
			end
		end
		-- deprecated as of 0.10.0 (nvim_buf_get_option)
		-- get all buffers
		-- local bufs = vim.api.nvim_list_bufs()
		--
		-- for _, bufnr in ipairs(bufs) do
		-- 	if vim.api.nvim_buf_get_option(bufnr, "modified") then
		-- 		vim.api.nvim_buf_call(bufnr, function()
		-- 			vim.cmd("write")
		-- 		end)
		-- 	end
		-- end
	end,
})

autocmd("BufWritePre", {
	desc = "Delete trailing whitespace",
	pattern = "*",
	group = AuGroup,
	command = [[%s/\s\+$//e]],
})

-- :help to vsplit
autocmd("BufEnter", {
	desc = "Split Vertical for help files",
	group = Helpvert,
	callback = function()
		vim.cmd([[
		   augroup Helpvert
		   autocmd!
		   autocmd FileType help wincmd L
		   augroup END
	   ]])
	end,
})

--highlight text when copy
autocmd("TextYankPost", {
	desc = "Highlight when yank",
	group = YankGroup,
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 100,
		})
	end,
})

--linting
--[[
autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lintGroup,
	pattern = { "*.ts, *.js, *.tsx" },
	callback = function()
		require("lint").try_lint()
	end,
})
--]]
