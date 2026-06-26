require("config.display")
require("config.keybinds")
require("config.workspace")
require("config.window")
require("config.animation")
require("envvar")

-- startup
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("awww-daemon --format argb")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("swaync")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("udiskie")
	hl.exec_cmd("protonvpn-app")
	hl.exec_cmd("bitwarden-desktop")
	hl.exec_cmd("ferdium", { workspace = 4 })
end)

-- permission
-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

hl.config({
	ecosystem = {
		no_donation_nag = true,
		no_update_news = true,
	},
	general = {
		gaps_in = 3,
		gaps_out = 7,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = true,
		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,
		layout = "master",
	},
	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 0.9,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 3,
			vibrancy = 0.1696,
		},
	},
	scrolling = {
		fullscreen_on_one_column = true,
		column_width = 1,
	},
	animations = {
		enabled = true,
	},
})

hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
	master = {
		new_status = "slave",
	},
})

hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
		vrr = 2,
		middle_click_paste = false,
	},
})

---------------
---- INPUT ----
---------------
hl.config({
	group = {
		groupbar = {
			height = 2,
			render_titles = false,
			gradients = true,
		},
	},
})

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:ctrl_modifier",
		kb_rules = "",
		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
		accel_profile = "flat",

		touchpad = {
			natural_scroll = false,
		},
	},
})

-- laptop
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
