local wezterm                 = require "wezterm"
local nerdfonts               = wezterm.nerdfonts
local functions               = require "utils.functions"
local oneDark                 = require("colors.oneDark")
local mod                     = {}

local GLYPH_SEMI_CIRCLE_LEFT  = nerdfonts.ple_left_half_circle_thick --[[ '' ]]
local GLYPH_SEMI_CIRCLE_RIGHT = nerdfonts.ple_right_half_circle_thick --[[ '' ]]
local GLYPH_TERMINAL          = nerdfonts.fa_terminal
local GLYPH_FOLDER            = nerdfonts.fa_folder
local GLYPH_USER              = nerdfonts.fa_user
local GLYPH_SERVER            = nerdfonts.fa_server
local GLYPH_CALENDAR          = nerdfonts.fa_calendar_o
local GLYPH_ZOOM_IN           = nerdfonts.cod_zoom_in
local GLYPH_COPY              = nerdfonts.md_content_copy
local GLYPH_DOCKER            = nerdfonts.linux_docker
local GLYPH_KUBERNETES        = nerdfonts.md_kuberntes
local GLYPH_REMOTE_DESKTOP    = nerdfonts.md_remote_desktop
local GLYPH_VIM               = nerdfonts.dev_vim
local GLYPH_MONITOR           = nerdfonts.md_monitor_eye
local GLYPH_WATCH             = nerdfonts.md_eye_outline

function mod.update_status(window, pane)
    -- Workspace name
    local active_key_table = window:active_key_table()
    local stat = string.format("%-8s", window:active_workspace())
    local workspace_color = oneDark.green
    local time = wezterm.strftime("%m-%d %H:%M")

    if active_key_table then
        stat = string.format("%-8s", active_key_table)
        workspace_color = oneDark.chalky
    elseif window:leader_is_active() then
        stat = string.format("%-8s", "leader")
        workspace_color = oneDark.coral
    end

    local username = os.getenv("USER") or os.getenv("LOGNAME") or os.getenv("USERNAME")
    local cwd_uri = pane:get_current_working_dir()
    local cwd = ""
    local hostname = ""
    if cwd_uri then
        cwd = cwd_uri.file_path
        hostname = cwd_uri.host or wezterm.hostname()
    end

    -- Left status (left of the tab line)
    window:set_left_status(wezterm.format({
        { Attribute = { Intensity = "Bold" } },
        { Background = { Color = oneDark.background } },
        { Text = " " },
        { Background = { Color = oneDark.background } },
        { Foreground = { Color = workspace_color } },
        { Text = GLYPH_SEMI_CIRCLE_LEFT },
        { Background = { Color = workspace_color } },
        { Foreground = { Color = oneDark.background } },
        { Text = GLYPH_TERMINAL .. " " },
        { Background = { Color = oneDark.background } },
        { Foreground = { Color = workspace_color } },
        { Text = " " .. stat },
    }))

    -- Right status
    window:set_right_status(wezterm.format({
        -- Wezterm has a built-in nerd fonts
        -- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
        --
        { Text = " " },
        { Background = { Color = oneDark.background } },
        { Foreground = { Color = oneDark.chalky } },
        { Text = GLYPH_SEMI_CIRCLE_LEFT },
        { Background = { Color = oneDark.chalky } },
        { Foreground = { Color = oneDark.background } },
        { Text = GLYPH_FOLDER .. " " },
        { Background = { Color = oneDark.background } },
        { Foreground = { Color = oneDark.lightWhite } },
        { Text = " " .. cwd },
        { Background = { Color = oneDark.background } },
        { Foreground = { Color = oneDark.background } },
        { Text = GLYPH_SEMI_CIRCLE_RIGHT },

        { Text = " " },
        { Background = { Color = oneDark.background } },
        { Foreground = { Color = oneDark.purple } },
        { Text = GLYPH_SEMI_CIRCLE_LEFT },
        { Background = { Color = oneDark.purple } },
        { Foreground = { Color = oneDark.background } },
        { Text = GLYPH_USER .. " " },
        { Background = { Color = oneDark.background } },
        { Foreground = { Color = oneDark.lightWhite } },
        { Text = " " .. username },
        { Background = { Color = oneDark.background } },
        { Foreground = { Color = oneDark.background } },
        { Text = GLYPH_SEMI_CIRCLE_RIGHT },

        { Text = " " },
        { Background = { Color = oneDark.background } },
        { Foreground = { Color = oneDark.fountainBlue } },
        { Text = GLYPH_SEMI_CIRCLE_LEFT },
        { Background = { Color = oneDark.fountainBlue } },
        { Foreground = { Color = oneDark.background } },
        { Text = GLYPH_SERVER .. " " },
        { Background = { Color = oneDark.background } },
        { Foreground = { Color = oneDark.lightWhite } },
        { Text = " " .. hostname },
        { Background = { Color = oneDark.background } },
        { Foreground = { Color = oneDark.background } },
        { Text = GLYPH_SEMI_CIRCLE_RIGHT },

        { Text = " " },
        { Background = { Color = oneDark.background } },
        { Foreground = { Color = oneDark.whiskey } },
        { Text = GLYPH_SEMI_CIRCLE_LEFT },
        { Background = { Color = oneDark.whiskey } },
        { Foreground = { Color = oneDark.background } },
        { Text = GLYPH_CALENDAR .. " " },
        { Background = { Color = oneDark.background } },
        { Foreground = { Color = oneDark.lightWhite } },
        { Text = " " .. time },
        { Background = { Color = oneDark.background } },
        { Foreground = { Color = oneDark.background } },
        { Text = GLYPH_SEMI_CIRCLE_RIGHT },
    }))
end

function mod.format_tab_title(config, tab, max_width)
    local colors       = wezterm.color.get_builtin_schemes()[config.color_scheme]
    local command_args = nil
    local command      = nil
    local pane         = tab.active_pane
    local title        = functions.tab_title(tab)
    local tab_number   = tostring(tab.tab_index + 1)
    local program      = pane.user_vars.WEZTERM_PROG
    -- Filter command name
    if not program or program ~= "" then
        command_args = program
        if command_args then
            command = string.match(command_args, "^%S+")
        end
    end

    -- Shrink title if too long
    if string.len(title) > max_width - 3 then
        title = string.sub(title, 1, max_width - 12) .. ".. "
    end

    -- Add terminal icon
    if tab.is_active then
        title = GLYPH_TERMINAL .. " " .. title
    end

    -- Add zoom icon
    if pane.is_zoomed then
        title = GLYPH_ZOOM_IN .. " " .. title
    end

    -- Add copy icon
    if string.match(pane.title, "^Copy mode:") then
        title = GLYPH_COPY .. " " .. title
    end

    -- Add icon to command
    if command then
        -- Add docker icon
        if command == "docker" or command == "podman" then
            title = GLYPH_DOCKER .. " " .. title
        end

        -- Add kubernetes icon
        if command == "kind" or command == "kubectl" then
            title = GLYPH_KUBERNETES .. " " .. title
        end

        -- Add ssh icon
        if command == "ssh" then
            title = GLYPH_REMOTE_DESKTOP .. " " .. title
        end

        -- Add monitoring icon
        if string.match(command, "^([bh]?)top") then
            title = GLYPH_MONITOR .. " " .. title
        end

        -- Add vim icon
        if string.match(command, "^(n?)vi(m?)") then
            title = GLYPH_VIM .. " " .. title
        end

        -- Add watch icon
        if command == "watch" then
            title = GLYPH_WATCH .. " " .. title
        end
    end

    -- Add bell icon
    -- on inactive panes if something shows up
    local has_unseen_output = false
    if not tab.is_active then
        for _, pane in ipairs(tab.panes) do
            if pane.has_unseen_output then
                has_unseen_output = true
                break
            end
        end
    end

    -- Add bell icon
    if has_unseen_output then
        title = nerdfonts.md_bell_ring_outline .. " " .. title
    end

    if tab.is_active then
        return {
            { Background = { Color = oneDark.background } },
            { Foreground = { Color = oneDark.malibu } },
            { Text = title .. " " },
            { Background = { Color = oneDark.malibu } },
            { Foreground = { Color = oneDark.background } },
            { Text = " " .. tab_number },
            { Background = { Color = oneDark.background } },
            { Foreground = { Color = oneDark.malibu } },
            { Text = GLYPH_SEMI_CIRCLE_RIGHT .. " " },
        }
    else
        return {
            { Background = { Color = oneDark.background } },
            { Foreground = { Color = oneDark.background } },
            { Text = GLYPH_SEMI_CIRCLE_LEFT },
            { Background = { Color = oneDark.background } },
            { Foreground = { Color = oneDark.lightWhite } },
            { Text = title .. " " },
            { Background = { Color = oneDark.whiskey } },
            { Foreground = { Color = oneDark.background } },
            { Text = " " .. tab_number },
            { Background = { Color = oneDark.background } },
            { Foreground = { Color = oneDark.whiskey } },
            { Text = GLYPH_SEMI_CIRCLE_RIGHT .. " " },
        }
    end
end

mod.setup = function()
    wezterm.on("update-status", function(window, pane)
        mod.update_status(window, pane)
    end)

    wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
        mod.format_tab_title(config, tab, max_width)
    end)
end

return mod
