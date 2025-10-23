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

-- BIDI for Arabic support
config.bidi_enabled = true
config.use_ime = true

-- Color Scheme
config.color_scheme = 'Argonaut (Gogh)'

-- Minimalization
config.window_decorations = 'RESIZE'
config.enable_tab_bar = false
config.warn_about_missing_glyphs = false

-- Key bindings
config.keys = {
	{
		key = 'w',
		mods = 'CMD',
		action = wezterm.action.CloseCurrentPane {confirm = false},
	},
}

return config

