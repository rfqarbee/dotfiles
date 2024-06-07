-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "*.txt", "help" },
-- 	callback = function()
-- 		vim.cmd("wincmd L")
-- 		vim.cmd("vert resize 80")
-- 	end,
-- })

vim.api.nvim_create_autocmd("BufWinEnter", {
	-- pattern = "help",
	callback = function()
		local filetype = vim.bo.filetype
		if filetype ~= "oil" and filetype ~= "" then
			print(filetype, "filetype")
			vim.cmd("wincmd L")
			vim.cmd("vert resize 80")
		end
	end,
})
