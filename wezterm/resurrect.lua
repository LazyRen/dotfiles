local wezterm   = require "wezterm"
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

-- resurrect.wezterm encryption
-- Uncomment the following to use encryption.
-- If you do, ensure you have the age tool installed, you have created an encryption key at ~/.config/age/wezterm-resurrect.txt,
-- and that you supply the associated public_key below.
-- age-keygen -o wezterm-resurrect.txt
resurrect.state_manager.set_encryption({
    enable      = true,
    method      = "/opt/homebrew/bin/age",
    private_key = wezterm.home_dir .. "/.config/age/wezterm-resurrect.txt",
    public_key  = "age13x4vsju99kvxf5t46h2rpnrmpfafcy9wz0dmwlzks0d20zhc0apsdjkzum",
})

resurrect.state_manager.periodic_save({ interval_seconds = 600, save_workspaces = true, save_windows = true, save_tabs = true })
resurrect.state_manager.set_max_nlines(5000)

local config = {}

config.keys = {
    {
        mods = "LEADER|SHIFT",
        key = "S",
        action = wezterm.action_callback(function(win, pane)
            resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
            resurrect.window_state.save_window_action()
        end),
    },
    {
        -- Load workspace or window state, using a fuzzy finder
        mods = "LEADER|SHIFT",
        key = "L",
        action = wezterm.action_callback(function(win, pane)
            resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
                local type = string.match(id, "^([^/]+)")  -- match before "/"
                id         = string.match(id, "([^/]+)$")  -- match after "/"
                id         = string.match(id, "(.+)%..+$") -- remove file extension

                local opts = {
                    -- window          = win:mux_window(),
                    relative        = true,
                    restore_text    = true,
                    on_pane_restore = resurrect.tab_state.default_on_pane_restore,
                }

                if type == "workspace" then
                    local state = resurrect.state_manager.load_state(id, "workspace")
                    resurrect.workspace_state.restore_workspace(state, opts)
                elseif type == "window" then
                    local state = resurrect.state_manager.load_state(id, "window")
                    resurrect.window_state.restore_window(pane:window(), state, opts)
                elseif type == "tab" then
                    local state = resurrect.state_manager.load_state(id, "tab")
                    resurrect.tab_state.restore_tab(pane:tab(), state, opts)
                end
            end)
        end),
    },
    {
        -- Delete a saved session using a fuzzy finder
        mods = "LEADER|SHIFT",
        key = "D",
        action = wezterm.action_callback(function(win, pane)
            resurrect.fuzzy_loader.fuzzy_load(
                win,
                pane,
                function(id)
                    resurrect.state_manager.delete_state(id)
                end,
                {
                    title             = "Delete State",
                    description       = "Select session to delete and press Enter = accept, Esc = cancel, / = filter",
                    fuzzy_description = "Search session to delete: ",
                    is_fuzzy          = true,
                }
            )
        end),
    },
}

return config
