local wezterm = require "wezterm"
local workspaceSwitcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local act = wezterm.action
local mod = {}

mod.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }

mod.keys = {
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
    { mods = "LEADER",       key = "w",          action = act.PromptInputLine { description = wezterm.format { { Attribute = { Intensity = "Bold" } }, { Foreground = { AnsiColor = "Fuchsia" } }, { Text = "Enter name for new workspace" } }, action = wezterm.action_callback(function(window, pane, line) if line then window:perform_action(act.SwitchToWorkspace { name = line }, pane) end end) } },
    { mods = "LEADER|SHIFT", key = "$",          action = act.PromptInputLine { description = wezterm.format { { Attribute = { Intensity = "Bold" } }, { Foreground = { AnsiColor = "Fuchsia" } }, { Text = "Enter new name for workspace" } }, action = wezterm.action_callback(function(window, pane, line) if line then wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line) end end) } },
    -- { mods = "LEADER", key = "s",          action = act.ShowLauncherArgs { flags = "WORKSPACES", title = "Workspace Selection" } }, -- Use smart_workspace_switcher instead
    { mods = "LEADER",       key = "s",          action = workspaceSwitcher.switch_workspace() },
    { mods = "LEADER",       key = "o",          action = act.PromptInputLine { description = wezterm.format { { Attribute = { Intensity = "Bold" } }, { Foreground = { AnsiColor = "Fuchsia" } }, { Text = "Enter a domain name to open" } }, action = wezterm.action_callback(function(window, pane, line) if line then window:mux_window():spawn_tab { domain = { DomainName = line } } end end) } },
    { mods = "LEADER",       key = "d",          action = act.DetachDomain "CurrentPaneDomain" },

    { mods = "NONE",         key = "PageUp",     action = wezterm.action({ ScrollByPage = -1 }) },
    { mods = "NONE",         key = "PageDown",   action = wezterm.action({ ScrollByPage = 1 }) },
    { mods = "OPT",          key = "LeftArrow",  action = wezterm.action { SendString = "\x1bb" } },
    { mods = "OPT",          key = "RightArrow", action = wezterm.action { SendString = "\x1bf" } },
    { mods = "CMD",          key = "LeftArrow",  action = wezterm.action { SendString = "\x1bOH" } },
    { mods = "CMD",          key = "RightArrow", action = wezterm.action { SendString = "\x1bOF" } },
}

for i = 1, 9 do
    table.insert(mod.keys, { mods = "LEADER",   key = tostring(i), action = act.ActivateTab(i - 1) })
    table.insert(mod.keys, { mods = "CTRL|CMD", key = tostring(i), action = act.MoveTab(i - 1) })
end

mod.key_tables = {
    resize_pane = {
        { key = "LeftArrow",  action = act.AdjustPaneSize { "Left", 5 } },
        { key = "RightArrow", action = act.AdjustPaneSize { "Right", 5 } },
        { key = "UpArrow",    action = act.AdjustPaneSize { "Up", 5 } },
        { key = "DownArrow",  action = act.AdjustPaneSize { "Down", 5 } },
        { key = "Escape",     action = "PopKeyTable" }, -- Cancel the mode by pressing escape
    },
}

return mod
