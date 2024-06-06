return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dapui = require("dapui")
		local dap = require("dap")

		dapui.setup()
		require("nvim-dap-virtual-text").setup({
			enabled = true,
		})

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "-i", "dap" },
		}

		dap.configurations.c = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
		}

		-- keymap
		vim.keymap.set("n", "<space>b", function()
			dap.toggle_breakpoint()
		end, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<space>gb", function()
			dap.run_to_cursor()
		end, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<space>?", function()
			dapui.eval(nil, { enter = true })
		end, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<F1>", function()
			dap.continue()
		end, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<F2>", function()
			dap.step_info()
		end, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<F3>", function()
			dap.step_over()
		end, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<F4>", function()
			dap.step_out()
		end, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<F5>", function()
			dap.step_back()
		end, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<F6>", function()
			dap.restart()
		end, { desc = "Toggle breakpoint" })

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
