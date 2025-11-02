-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()
--local mux = wezterm.mux
config.bypass_mouse_reporting_modifiers = "ALT"
config.front_end = "OpenGL"
config.max_fps = 144
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color" -- Set the terminal type

-- config.font = wezterm.font("AnonymicePro Nerd Font")
config.font = wezterm.font("BigBlueTerm437 Nerd Font")
-- config.font = wezterm.font("DepartureMono Nerd Font")
-- config.font = wezterm.font("Unifont")
-- config.font = wezterm.font("NK57 Monospace")
-- config.font = wezterm.font("Terminess Nerd Font")
config.cell_width = 0.9
config.window_background_opacity = 1
config.prefer_egl = true
config.font_size = 19.0

config.window_padding = {
	left = 0,
	right = 0,
	top = 5,
	bottom = 0,
}

-- tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.keys = {
	{
		key = "O",
		mods = "CTRL|ALT",
		-- toggling opacity
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.9
			else
				overrides.window_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},
	{ key = "PageUp", mods = "CTRL", action = act.ScrollByPage(-1) },
	{ key = "PageDown", mods = "CTRL", action = act.ScrollByPage(1) },
}

-- For example, changing the color scheme:
config.color_scheme = "Rosé Pine (Gogh)"
config.colors = {
	background = "#000000", -- almost black
	cursor_border = "#bea3c7",
	cursor_bg = "#FFFFFF",

	tab_bar = {
		background = "#0c0b0f",
		active_tab = {
			bg_color = "#0c0b0f",
			fg_color = "#bea3c7",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#0c0b0f",
			fg_color = "#f8f2f5",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},

		new_tab = {
			-- bg_color = "rgba(59, 34, 76, 50%)",
			bg_color = "#0c0b0f",
			fg_color = "white",
		},
	},
}

config.window_frame = {
	font = wezterm.font({ family = "Iosevka Custom", weight = "Regular" }),
	active_titlebar_bg = "#0c0b0f",
	-- active_titlebar_bg = "#181616",
}

config.window_decorations = "NONE | RESIZE"
config.default_prog = { "/bin/bash", "-l" } -- or your preferred shell
config.initial_cols = 80
return config
