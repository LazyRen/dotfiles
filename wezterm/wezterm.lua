local wezterm = require "wezterm"
local workspaceSwitcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local config = wezterm.config_builder()

package.path = wezterm.home_dir .. "/.config/wezterm/?.lua;" .. package.path
local status = require "status"
local keys = require "keys"

config.font = wezterm.font_with_fallback { "JetBrainsMono Nerd Font", "Sarasa Gothic K Nerd Font" }
config.font_size = 16

config.color_scheme = "OneDark (base16)"
local colors = wezterm.color.get_builtin_schemes()[config.color_scheme]
config.colors = {
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
config.term = "xterm-256color"

config.audible_bell = "Disabled"
config.colors = { visual_bell = "#202020" }
config.exit_behavior = "Hold"
config.hide_tab_bar_if_only_one_tab = false
config.inactive_pane_hsb = { brightness = 0.75, hue = 1.0, saturation = 1.0 }
config.prefer_to_spawn_tabs = true
config.scrollback_lines = 1000000
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.status_update_interval = 1000
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_bar_at_bottom = true
config.tab_max_width = 32
config.unix_domains = { { name = "unix" } }
config.use_fancy_tab_bar = false
config.visual_bell = { fade_in_duration_ms = 75, fade_out_duration_ms = 75, target = "CursorColor" }
config.warn_about_missing_glyphs = false
config.webgpu_power_preference = "HighPerformance"
config.window_background_opacity = 1
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }

--SSH domains
local ssh_domains = {}
for host, contents in pairs(wezterm.enumerate_ssh_hosts()) do
    table.insert(ssh_domains, {
        name = host,
        remote_address = contents.hostname,
        username = contents.user,
        ssh_option = { identityfile = contents.identityfile },
        local_echo_threshold_ms = 50000,
        assume_shell = "Posix"
    })
end
config.ssh_domains = ssh_domains

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = keys.keys
config.key_tables = keys.key_tables

workspaceSwitcher.get_choices = function(opts)
    -- this will ONLY show the workspace elements, NOT the Zoxide results
    return workspaceSwitcher.choices.get_workspace_elements({})
end

wezterm.on("update-status", function(window, pane)
    status.update_status(config, window, pane)
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    status.format_tab_title(config, tab, max_width)
end)

return config
