local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- appearance
config.color_scheme = "rose-pine-moon"
-- config.font = wezterm.font("Iosevka Nerd Font Mono")
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 15.0
config.line_height = 1.1
config.window_background_opacity = 0.8
config.macos_window_background_blur = 50
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

config.window_padding = {
	left = 3,
	right = 3,
	top = 3,
	bottom = 3,
}
config.enable_tab_bar = true

-- behavior
-- config.audible_bell = "Disabled"
config.scrollback_lines = 10000

return config
