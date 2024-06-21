return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()
		require("nvim-dap-virtual-text").setup({
			enabled = true,
		})
		require("custom.dap")

		-- keymap
		vim.keymap.set("n", "<space>b", function()
			dap.toggle_breakpoint()
		end, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<space>dc", function()
			dap.run_to_cursor()
		end, { desc = "Run to cursor" })
		vim.keymap.set("n", "<space>?", function()
			dapui.eval(nil, { enter = true })
		end, { desc = "Eval dapui" })
		vim.keymap.set("n", "<F1>", function()
			dap.continue()
		end, { desc = "Continue" })
		vim.keymap.set("n", "<F2>", function()
			dap.step_info()
		end, { desc = "Step into" })
		vim.keymap.set("n", "<F3>", function()
			dap.step_over()
		end, { desc = "Step over" })
		vim.keymap.set("n", "<F4>", function()
			dap.step_out()
		end, { desc = "Step out" })
		vim.keymap.set("n", "<F5>", function()
			dap.step_back()
		end, { desc = "Step back" })
		vim.keymap.set("n", "<F6>", function()
			dap.restart()
		end, { desc = "Restart" })

		vim.keymap.set("n", "<space>dd", function()
			dapui.toggle()
		end, { desc = "Dap-ui" })

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
