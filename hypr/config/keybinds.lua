local mainMod = "SUPER"
local terminal = "ghostty"
local fileManager = "ghostty --title=Yazi -e yazi"
local menu = "rofi -show drun -theme ~/.config/rofi/applaunch.rasi"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(
	mainMod .. "+ SHIFT " .. " + End",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT+ F", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(menu))
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + X", hl.dsp.window.pin())

hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + comma", hl.dsp.group.lock())
hl.bind(mainMod .. " + period", hl.dsp.window.move({ out_of_group = true }))
hl.bind(mainMod .. "+ Left", hl.dsp.group.move_window({ forward = false }))
hl.bind(mainMod .. "+ Right", hl.dsp.group.move_window({ forward = true }))
hl.bind("ALT + Grave", hl.dsp.group.next())
hl.bind("ALT + SHIFT + Grave", hl.dsp.group.prev())
hl.bind("ALT + Escape", hl.dsp.focus({ workspace = "previous" }))
hl.bind("ALT + Tab", hl.dsp.focus({ last = true }))

hl.bind(mainMod .. " + b", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + Slash", hl.dsp.exec_cmd("$LOCAL_DIR/scripts/search.sh"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("$LOCAL_DIR/scripts/wallpaper_change.sh")) -- hard restart
hl.bind(mainMod .. " + F6", hl.dsp.exec_cmd("$LOCAL_DIR/scripts/watchwaybar.sh")) -- hard restart
hl.bind(mainMod .. " + F7", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))
hl.bind(mainMod .. " + F8", hl.dsp.exec_cmd("$LOCAL_DIR/scripts/clipboard.sh"))

hl.bind("Print", hl.dsp.exec_cmd("$LOCAL_DIR/scripts/grimshot.sh --monitor"))
hl.bind(mainMod .. "+ SHIFT+S", hl.dsp.exec_cmd("$LOCAL_DIR/scripts/grimshot.sh --swappy"))
hl.bind(mainMod .. "+ SHIFT+Print", hl.dsp.exec_cmd("$LOCAL_DIR/scripts/screen_record.sh"))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- scratchpad
hl.bind(mainMod .. " + s", hl.dsp.workspace.toggle_special("todo"))
hl.bind(mainMod .. " + n", hl.dsp.workspace.toggle_special("notes"))

-- mouse binding
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + mouse:276", function()
	local current = hl.get_config("cursor.zoom_factor")
	if current ~= 1 then
		current = 1
	else
		current = 6
	end
	current = math.max(1, math.min(6, current))
	hl.config({ cursor = { zoom_factor = current } })
end)

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
