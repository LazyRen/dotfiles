local wezterm = require "wezterm"
local module  = {}

local function has_value(tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function notify(subject, msg, urgency)
    local allowed_urgency = { "low", "normal", "critical" }
    urgency = urgency or "normal"
    if not has_value(allowed_urgency, urgency) then
        urgency = "normal"
    end

    wezterm.run_child_process {
        "notify-send",
        "-i",
        "org.wezfurlong.wezterm",
        "-a",
        "wezterm",
        "-u",
        urgency,
        subject,
        msg
    }
end

module.send = notify

return module
