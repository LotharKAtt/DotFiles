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

-- Disable tabs
config.enable_tab_bar = false

-- Disable the audible bell
config.audible_bell = "Disabled" -- Disable|SystemBeep

-- Disable close clonfirmation
config.window_close_confirmation = "NeverPrompt" -- AlwaysPrompt|NeverPrompt

-- Decoration
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 10

-- Hyperlink fix
config.hyperlink_rules = {
      -- Matches: a URL in parens: (URL)
      {
         regex = '\\((\\w+://\\S+)\\)',
         format = '$1',
         highlight = 1,
      },
      -- Matches: a URL in brackets: [URL]
      {
         regex = '\\[(\\w+://\\S+)\\]',
         format = '$1',
         highlight = 1,
      },
      -- Matches: a URL in curly braces: {URL}
      {
         regex = '\\{(\\w+://\\S+)\\}',
         format = '$1',
         highlight = 1,
      },
      -- Matches: a URL in angle brackets: <URL>
      {
         regex = '<(\\w+://\\S+)>',
         format = '$1',
         highlight = 1,
      },
      -- Then handle URLs not wrapped in brackets
      {
         regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
         format = '$0',
      },
      -- implicit mailto link
      {
         regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
         format = 'mailto:$0',
      },
   }


return config
