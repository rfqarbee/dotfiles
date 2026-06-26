local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(false)

-- example
-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

hl.window_rule({
	name = "xwayland-video-bridge-fixes",
	match = { class = "xwaylandvideobridge" },
	no_initial_focus = true,
	no_focus = true,
	no_anim = true,
	no_blur = true,
	max_size = "1 1",
	opacity = 0.0,
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({ name = "File Manager", match = { title = "Yazi" }, float = true, size = { 1680, 950 }, center = true })
hl.window_rule({ match = { class = "org.gnome.Calculator" }, float = true, size = { 400, 500 }, center = true })

-- TODO: fix
hl.window_rule({
	match = { class = "feh" },
	float = true,
	size = { 1280, 800 },
	center = true,
})

hl.window_rule({
	match = { class = "io.ente.auth" },
	float = true,
	size = { 1200, 800 },
	center = true,
	no_screen_share = true,
})
hl.window_rule({
	match = { class = "Bitwarden" },
	float = true,
	size = { 1400, 900 },
	center = true,
	no_screen_share = true,
})
hl.window_rule({
	match = { class = "io.github.celluloid_player.Celluloid" },
	float = true,
	size = { 1400, 900 },
	center = true,
})
hl.window_rule({ match = { class = "yad" }, float = true, size = { 650, 700 }, center = true })
hl.window_rule({ match = { class = "blueman-manager" }, float = true, size = { 650, 700 }, center = true })
hl.window_rule({ match = { class = "thunar" }, float = true, size = { 1000, 900 }, center = true })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, float = true, size = { 1000, 900 }, center = true })
hl.window_rule({ match = { class = "zen" }, opacity = "1.0 1.1" })
hl.window_rule({
	match = { title = "Picture-in-Picture", class = "zen" },
	maximize = true,
	workspace = "4",
})

hl.window_rule({ name = "terminal", workspace = "1", match = { class = "kitty" } })

hl.window_rule({ match = { class = "gimp", title = "GNU Image Manipulation Program" }, tag = "+apps" })
hl.window_rule({ match = { class = "blender" }, tag = "+apps" })

hl.window_rule({ match = { class = "steam", title = "Steam" }, tag = "+appgroup" })
hl.window_rule({ match = { class = "Ferdium" }, tag = "+appgroup" })
hl.window_rule({
	match = { class = "steam", title = "Friends List" },
	float = true,
	center = true,
	size = { 400, 700 },
	tag = "+appgroup",
})
hl.window_rule({
	match = { class = "steam", title = "Steam Settings" },
	float = true,
	center = true,
	size = { 1200, 900 },
	tag = "+appgroup",
})
hl.window_rule({ match = { class = "vesktop" }, tag = "+appgroup" })

hl.window_rule({ match = { class = "org.kde.okular" }, tag = "+file" })
hl.window_rule({ match = { class = "libreoffice.*" }, tag = "+file" })

-- game related
hl.window_rule({
	match = { content = "game", fullscreen = true },
	confine_pointer = true,
	workspace = "10",
	fullscreen = true,
	no_blur = true,
	no_anim = true,
})
hl.window_rule({
	match = { class = "^(gamescope)$" },
	fullscreen = true,
	tag = "+game",
	workspace = "10",
	no_blur = true,
	no_anim = true,
	confine_pointer = true,
})
hl.window_rule({
	match = { class = "^(steam_proton)$" },
	fullscreen = true,
	tag = "+game",
	workspace = "10",
	no_blur = true,
	no_anim = true,
	confine_pointer = true,
})
hl.window_rule({
	match = { class = "^(steam_app_\\d+)$" },
	fullscreen = true,
	tag = "+game",
	workspace = "10",
	no_blur = true,
	no_anim = true,
	confine_pointer = true,
})

-- TODO: not working, not sure why
-- hl.window_rule({
-- 	match = { tag = "game", content = "game", fullscreen = true },
-- 	workspace = "10",
-- 	no_blur = true,
-- 	no_anim = true,
-- 	confine_pointer = true,
-- })
hl.window_rule({ match = { tag = "apps" }, workspace = "2" })
hl.window_rule({ match = { tag = "file" }, workspace = "3" })
hl.window_rule({ match = { tag = "appgroup" }, workspace = "4" })
