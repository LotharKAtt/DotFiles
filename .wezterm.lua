-- _             _    _                   _   __  ___   _    _
--| |           | |  | |                 | | / / / _ \ | |  | |
--| |      ___  | |_ | |__    __ _  _ __ | |/ / / /_\ \| |_ | |_
--| |     / _ \ | __|| '_ \  / _` || '__||    \ |  _  || __|| __|
--| |____| (_) || |_ | | | || (_| || |   | |\  \| | | || |_ | |_
--\_____/ \___/  \__||_| |_| \__,_||_|   \_| \_/\_| |_/ \__| \__|
--
-- Author: Pavel 'LotharKAtt' Cizinsky
-- Repository: github.com/LotharKAtt/DotFiles
-- wezterm config file (https://github.com/wez/wezterm)

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Color schema
-- https://wezfurlong.org/wezterm/colorschemes/t/index.html#tokyo-night-day
config.color_scheme = 'Tokyo Night Day'

config.font_size = 18

config.enable_tab_bar = false

-- Disable the audible bell 
config.audible_bell = "Disabled" -- Disable|SystemBeep

-- Disable close clonfirmation 
config.window_close_confirmation = "NeverPrompt" -- AlwaysPrompt|NeverPrompt

-- Decoration
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 10

return config
