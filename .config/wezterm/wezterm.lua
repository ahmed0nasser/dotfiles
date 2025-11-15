local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- General
config.font_size = 20
-- line_height is glitchy when zoom out
-- config.line_height = 1.2
config.font = wezterm.font("DejaVuSansM Nerd Font Mono")
-- another good font for arabic
-- config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.freetype_render_target = "HorizontalLcd"

-- BIDI for Arabic support
config.bidi_enabled = true
config.use_ime = true

-- Color Scheme
config.color_scheme = 'Dark Pastel (Gogh)'

-- Minimalization
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true
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

