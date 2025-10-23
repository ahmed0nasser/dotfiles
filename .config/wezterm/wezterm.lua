local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- General
config.font_size = 20
config.line_height = 1.2
config.font = wezterm.font_with_fallback({
	"DejaVuSansM Nerd Font Mono",
	"Noto Naskh Arabic",
	"Noto Sans",
})
config.warn_about_missing_glyphs = false

-- BIDI for Arabic support
config.bidi_enabled = true
config.use_ime = true

-- Colors
config.colors = {
	cursor_bg = "#E5E5E5",
	cursor_border = "#E5E5E5",
}

config.window_decorations = 'RESIZE'
config.enable_tab_bar = false

-- Key bindings
config.keys = {
	{
		key = 'w',
		mods = 'CMD',
		action = wezterm.action.CloseCurrentPane {confirm = false},
	},
}

return config

