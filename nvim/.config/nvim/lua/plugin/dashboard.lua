return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
		config = function()
			require("dashboard").setup({
				theme = "doom",
				disable_move = true,
				config = {
					-- header = { "TEst" },
					header = {
						[[=================     ===============     ===============   ========  ========]],
						[[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
						[[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
						[[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
						[[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
						[[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
						[[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
						[[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
						[[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
						[[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
						[[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
						[[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
						[[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
						[[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
						[[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
						[[||.=='    _-'                                                     `' |  /==.||]],
						[[=='    _-'                        N E O V I M                         \/   `==]],
						[[\   _-'                                                                `-_   /]],
						[[ `''                                                                      ``' ]],
					},
					center = {
						{
							icon = "  ",
							icon_hl = "Number",
							desc = "Search File",
							key = "E",
							keymap = "Alt",
							key_hl = "Number",
							key_format = " %s", -- remove default surrounding `[]`
							action = "lua print(3)",
						},
						{
							icon = "󰬵  ",
							icon_hl = "Number",
							desc = "Live Grep",
							key = "F",
							keymap = "Alt",
							key_hl = "Number",
							key_format = " %s", -- remove default surrounding `[]`
							action = "lua print(3)",
						},
						{
							icon = "󰏇  ",
							icon_hl = "Number",
							desc = "Oil",
							key = "-",
							keymap = "Space",
							key_hl = "Number",
							key_format = " %s", -- remove default surrounding `[]`
							action = "lua print(2)",
						},
						{
							icon = "  ",
							icon_hl = "Title",
							desc = "Neovim Config",
							key = "c",
							keymap = "SPC n",
							key_format = " %s", -- remove default surrounding `[]`
							action = "lua print(3)",
						},
					},
				},
			})
		end,
	},
}
