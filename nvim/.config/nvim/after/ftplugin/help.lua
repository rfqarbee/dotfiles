-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "help",
-- 	callback = function()
-- 		local filetype = vim.bo.filetype
-- 		print(filetype, "ttpe")
--
-- 		vim.cmd("wincmd L")
-- 		vim.cmd("vert resize 90")
-- 	end,
-- })

vim.api.nvim_create_autocmd("BufWinEnter", {
	-- pattern = "help",
	callback = function()
		local filetype = vim.bo.filetype
		if filetype == "help" then
			print(filetype, "filetype")
			vim.cmd("wincmd L")
			vim.cmd("vert resize 90")
		end
	end,
})
