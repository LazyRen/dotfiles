local colors = require("colors.schema")
local mod = {}

mod.colors = colors

mod.hide_tab_bar_if_only_one_tab = false
mod.inactive_pane_hsb = { brightness = 0.75, hue = 1.0, saturation = 1.0 }
mod.scrollback_lines = 10000000
mod.enable_scroll_bar = true
mod.show_new_tab_button_in_tab_bar = false
mod.show_tab_index_in_tab_bar = true
mod.status_update_interval = 1000
mod.tab_bar_at_bottom = true
mod.tab_max_width = 32
mod.use_fancy_tab_bar = false
mod.visual_bell = { fade_in_duration_ms = 75, fade_out_duration_ms = 75, target = "CursorColor" }
mod.window_background_opacity = 1
mod.window_decorations = "RESIZE"
mod.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }

return mod
