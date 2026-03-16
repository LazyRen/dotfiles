local wezterm = require "wezterm"
local mod = {}

mod.font = wezterm.font_with_fallback { "JetBrainsMono Nerd Font", "Sarasa Gothic K Nerd Font" }
mod.font_size = 16

return mod
