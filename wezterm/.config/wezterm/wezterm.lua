local wezterm = require("wezterm")

local config = {}

config.default_cursor_style = "SteadyUnderline"
config.color_scheme = "One Dark (Gogh)"
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium", stretch = "Normal", style = "Normal" })
config.font_size = 11
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "NONE"
config.enable_tab_bar = false

config.automatically_reload_config = true

return config
