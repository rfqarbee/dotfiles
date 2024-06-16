vim.keymap.set({ "n", "v" }, "q", "<cmd>q<cr>", { desc = "Quit help" })

-- vim.api.nvim_create_autocmd("BufWinEnter", {
-- 	-- pattern = "help",
-- 	callback = function()
-- 		local filetype = vim.bo.filetype
-- 		if filetype == "help" then
-- 			vim.cmd("wincmd L")
-- 			vim.cmd("vert resize 90")
-- 		end
-- 	end,
-- })
