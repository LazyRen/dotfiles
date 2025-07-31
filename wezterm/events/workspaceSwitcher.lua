local wezterm = require "wezterm"
local mod = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

mod.get_choices = function(opts)
    -- this will ONLY show the workspace elements, NOT the Zoxide results
    return mod.choices.get_workspace_elements({})
end

return mod
