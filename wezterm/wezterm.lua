local wezterm = require "wezterm"

local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local act = wezterm.action
local config = wezterm.config_builder()
package.path = wezterm.home_dir .. "/.config/wezterm/?.lua;" .. package.path
local merge = require "merge"
local resurrect = require "resurrect"

config.color_scheme = "OneHalfDark"
config.color_scheme = "OneDark (base16)"
config.term = "xterm-256color"
config.font = wezterm.font_with_fallback { "JetBrainsMono Nerd Font", "Sarasa Gothic K Nerd Font" }
config.font_size = 16

config.audible_bell = "Disabled"
config.colors = { visual_bell = "#202020" }
config.pane_focus_follows_mouse = true
config.prefer_to_spawn_tabs = true
config.scrollback_lines = 5000
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
config.hide_tab_bar_if_only_one_tab = false
config.exit_behavior = "Hold"

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

-- for multiplexing
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
    { mods = "LEADER",       key = "Enter",      action = act.ActivateCopyMode },
    { mods = "LEADER",       key = "'",          action = act.SplitVertical { domain = "CurrentPaneDomain" } },
    { mods = "LEADER",       key = "-",          action = act.SplitVertical { domain = "CurrentPaneDomain" } },
    { mods = "LEADER",       key = ";",          action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { mods = "LEADER",       key = "\\",         action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { mods = "LEADER",       key = "`",          action = act.PaneSelect { mode = "SwapWithActiveKeepFocus" } },
    { mods = "LEADER",       key = "LeftArrow",  action = act.ActivatePaneDirection "Left" },
    { mods = "LEADER",       key = "RightArrow", action = act.ActivatePaneDirection "Right" },
    { mods = "LEADER",       key = "UpArrow",    action = act.ActivatePaneDirection "Up" },
    { mods = "LEADER",       key = "DownArrow",  action = act.ActivatePaneDirection "Down" },
    { mods = "LEADER",       key = "]",          action = act.RotatePanes "Clockwise" },
    { mods = "LEADER",       key = "[",          action = act.RotatePanes "CounterClockwise" },
    { mods = "LEADER",       key = "z",          action = act.TogglePaneZoomState },
    { mods = "LEADER",       key = "r",          action = act.ActivateKeyTable { name = "resize_pane", one_shot = false } },
    { mods = "LEADER",       key = "x",          action = act.CloseCurrentPane { confirm = false } },
    { mods = "LEADER",       key = "m",          action = act { PaneSelect = { alphabet = "0123456789" } } },
    { mods = "LEADER",       key = "c",          action = act.SpawnTab "CurrentPaneDomain" },
    { mods = "LEADER",       key = "n",          action = act.ActivateTabRelative(1) },
    { mods = "LEADER",       key = "p",          action = act.ActivateTabRelative(-1) },
    { mods = "LEADER",       key = "t",          action = act.PromptInputLine { description = wezterm.format { { Attribute = { Intensity = "Bold" } }, { Foreground = { AnsiColor = "Fuchsia" } }, { Text = "Enter name for new tab" } }, action = wezterm.action_callback(function(window, pane, line) if line then window:active_tab():set_title(line) end end) } },
    -- { mods = "LEADER", key = "s",          action = act.ShowLauncherArgs { flags = "WORKSPACES", title = "Workspace Selection" } }, -- Use smart_workspace_switcher instead
    { mods = "LEADER",       key = "w",          action = act.PromptInputLine { description = wezterm.format { { Attribute = { Intensity = "Bold" } }, { Foreground = { AnsiColor = "Fuchsia" } }, { Text = "Enter name for new workspace" } }, action = wezterm.action_callback(function(window, pane, line) if line then window:perform_action(act.SwitchToWorkspace { name = line }, pane) end end) } },
    { mods = "LEADER|SHIFT", key = "$",          action = act.PromptInputLine { description = wezterm.format { { Attribute = { Intensity = "Bold" } }, { Foreground = { AnsiColor = "Fuchsia" } }, { Text = "Enter new name for workspace" } }, action = wezterm.action_callback(function(window, pane, line) if line then wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line) end end) } },
    { mods = "LEADER",       key = "s",          action = workspace_switcher.switch_workspace() },
    { mods = "LEADER",       key = "o",          action = act.PromptInputLine { description = wezterm.format { { Attribute = { Intensity = "Bold" } }, { Foreground = { AnsiColor = "Fuchsia" } }, { Text = "Enter a domain name to open" } }, action = wezterm.action_callback(function(window, pane, line) if line then window:mux_window():spawn_tab { domain = { DomainName = line } } end end) } },
    { mods = "LEADER",       key = "d",          action = act.DetachDomain "CurrentPaneDomain" },

    { mods = "NONE",         key = "PageUp",     action = wezterm.action({ ScrollByPage = -1 }) },
    { mods = "NONE",         key = "PageDown",   action = wezterm.action({ ScrollByPage = 1 }) },
    { mods = "OPT",          key = "LeftArrow",  action = wezterm.action { SendString = "\x1bb" } },
    { mods = "OPT",          key = "RightArrow", action = wezterm.action { SendString = "\x1bf" } },
    { mods = "CMD",          key = "LeftArrow",  action = wezterm.action { SendString = "\x1bOH" } },
    { mods = "CMD",          key = "RightArrow", action = wezterm.action { SendString = "\x1bOF" } },
}

config.keys = merge.all(config.keys, resurrect.keys)

workspace_switcher.get_choices = function(opts)
    -- this will ONLY show the workspace elements, NOT the Zoxide results
    return workspace_switcher.choices.get_workspace_elements({})
end

for i = 1, 9 do
    table.insert(config.keys, { mods = "LEADER", key = tostring(i), action = act.ActivateTab(i - 1) })
    table.insert(config.keys, { mods = "CTRL|CMD", key = tostring(i), action = act.MoveTab(i - 1) })
end

config.key_tables = {
    resize_pane = {
        { key = "LeftArrow",  action = act.AdjustPaneSize { "Left", 5 } },
        { key = "RightArrow", action = act.AdjustPaneSize { "Right", 5 } },
        { key = "UpArrow",    action = act.AdjustPaneSize { "Up", 5 } },
        { key = "DownArrow",  action = act.AdjustPaneSize { "Down", 5 } },
        { key = "Escape",     action = "PopKeyTable" }, -- Cancel the mode by pressing escape
    },
}

wezterm.on("smart_workspace_switcher.workspace_switcher.chosen", function(window, workspace)
    local gui_win = window:gui_window()
    local base_path = string.gsub(workspace, "(.*[/\\])(.*)", "%2")
    gui_win:set_right_status(wezterm.format({
        { Foreground = { Color = "gray" } },
        { Text = base_path .. "  " },
    }))
end)

wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, workspace)
    local gui_win = window:gui_window()
    local base_path = string.gsub(workspace, "(.*[/\\])(.*)", "%2")
    gui_win:set_right_status(wezterm.format({
        { Foreground = { Color = "gray" } },
        { Text = base_path .. "  " },
    }))
end)

return config
