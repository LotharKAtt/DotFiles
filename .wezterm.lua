-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Color schema
-- https://wezfurlong.org/wezterm/colorschemes/n/index.html#night-owlish-light
config.color_scheme = "Night Owlish Light"

config.font_size = 18

config.enable_tab_bar = false

-- Disable the audible bell 
config.audible_bell = "Disabled" -- Disable|SystemBeep

-- Disable close clonfirmation 
config.window_close_confirmation = "NeverPrompt" -- AlwaysPrompt|NeverPrompt

-- Decoration
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

return config
