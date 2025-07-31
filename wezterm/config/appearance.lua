local wezterm = require "wezterm"
local mod = {}

mod.color_scheme = "OneDark (base16)"
local colors = wezterm.color.get_builtin_schemes()[mod.color_scheme]
mod.colors = {
    compose_cursor = colors.ansi[2],
    cursor_bg = colors.ansi[5],
    cursor_border = colors.ansi[5],
    split = colors.ansi[5],
    tab_bar = {
        background = colors.background,
        active_tab = {
            bg_color = colors.background,
            fg_color = colors.ansi[5],
            italic = true,
        }
    },
    visual_bell = colors.ansi[1]
}

mod.hide_tab_bar_if_only_one_tab = false
mod.inactive_pane_hsb = { brightness = 0.75, hue = 1.0, saturation = 1.0 }
mod.scrollback_lines = 1000000
mod.show_new_tab_button_in_tab_bar = false
mod.show_tab_index_in_tab_bar = true
mod.status_update_interval = 1000
mod.tab_bar_at_bottom = true
mod.tab_max_width = 32
mod.visual_bell = { fade_in_duration_ms = 75, fade_out_duration_ms = 75, target = "CursorColor" }
mod.window_background_opacity = 1
mod.window_decorations = "RESIZE"
mod.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }

return mod
