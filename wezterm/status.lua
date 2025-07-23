local wezterm   = require "wezterm"
local nerdfonts = wezterm.nerdfonts
package.path    = wezterm.home_dir .. "/.config/wezterm/?.lua;" .. package.path
local functions = require "functions"
local status    = {}

function status.update_status(config, window, pane)
    local colors = wezterm.color.get_builtin_schemes()[config.color_scheme]
    -- Workspace name
    local active_key_table = window:active_key_table()
    local stat = window:active_workspace()
    local workspace_color = colors.ansi[3]
    local time = wezterm.strftime("%m-%d %H:%M")

    if active_key_table then
        stat = active_key_table
        workspace_color = colors.ansi[4]
    elseif window:leader_is_active() then
        stat = "leader"
        workspace_color = colors.ansi[2]
    end

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
        { Background = { Color = colors.background } },
        { Text = " " },
        { Background = { Color = colors.background } },
        { Foreground = { Color = workspace_color } },
        { Text = nerdfonts.ple_left_half_circle_thick },
        { Background = { Color = workspace_color } },
        { Foreground = { Color = colors.ansi[1] } },
        { Text = nerdfonts.cod_terminal_tmux .. " " },
        { Background = { Color = colors.ansi[1] } },
        { Foreground = { Color = workspace_color } },
        { Text = " " .. stat .. " " },
        { Background = { Color = colors.background } },
        { Foreground = { Color = colors.ansi[1] } },
        { Text = nerdfonts.ple_right_half_circle_thick .. " " },
    }))

    -- Right status
    window:set_right_status(wezterm.format({
        -- Wezterm has a built-in nerd fonts
        -- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
        --
        { Text = " " },
        { Background = { Color = colors.background } },
        { Foreground = { Color = colors.ansi[4] } },
        { Text = nerdfonts.ple_left_half_circle_thick },
        { Background = { Color = colors.ansi[4] } },
        { Foreground = { Color = colors.background } },
        { Text = nerdfonts.md_folder .. " " },
        { Background = { Color = colors.ansi[1] } },
        { Foreground = { Color = colors.foreground } },
        { Text = " " .. cwd },
        { Background = { Color = colors.background } },
        { Foreground = { Color = colors.ansi[1] } },
        { Text = nerdfonts.ple_right_half_circle_thick },

        -- { Text       = " "                                   },
        -- { Background = { Color = colors.background }         },
        -- { Foreground = { Color = colors.ansi[6] }            },
        -- { Text       = nerdfonts.ple_left_half_circle_thick  },
        -- { Background = { Color = colors.ansi[6] }            },
        -- { Foreground = { Color = colors.background }         },
        -- { Text       = nerdfonts.fa_user .. " "              },
        -- { Background = { Color = colors.ansi[1] }            },
        -- { Foreground = { Color = colors.foreground }         },
        -- { Text       = " " .. custom.username                },
        -- { Background = { Color = colors.background }         },
        -- { Foreground = { Color = colors.ansi[1] }            },
        -- { Text       = nerdfonts.ple_right_half_circle_thick },

        { Text = " " },
        { Background = { Color = colors.background } },
        { Foreground = { Color = colors.ansi[7] } },
        { Text = nerdfonts.ple_left_half_circle_thick },
        { Background = { Color = colors.ansi[7] } },
        { Foreground = { Color = colors.ansi[1] } },
        { Text = nerdfonts.cod_server .. " " },
        { Background = { Color = colors.ansi[1] } },
        { Foreground = { Color = colors.foreground } },
        { Text = " " .. hostname },
        { Background = { Color = colors.background } },
        { Foreground = { Color = colors.ansi[1] } },
        { Text = nerdfonts.ple_right_half_circle_thick },

        { Text = " " },
        { Background = { Color = colors.background } },
        { Foreground = { Color = colors.ansi[8] } },
        { Text = nerdfonts.ple_left_half_circle_thick },
        { Background = { Color = colors.ansi[8] } },
        { Foreground = { Color = colors.background } },
        { Text = nerdfonts.md_calendar_clock .. " " },
        { Background = { Color = colors.ansi[1] } },
        { Foreground = { Color = colors.foreground } },
        { Text = " " .. time },
        { Background = { Color = colors.background } },
        { Foreground = { Color = colors.ansi[1] } },
        { Text = nerdfonts.ple_right_half_circle_thick },
    }))
end

function status.format_tab_title(config, tab, max_width)
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
        title = nerdfonts.dev_terminal .. " " .. title
    end

    -- Add zoom icon
    if pane.is_zoomed then
        title = nerdfonts.cod_zoom_in .. " " .. title
    end

    -- Add copy icon
    if string.match(pane.title, "^Copy mode:") then
        title = nerdfonts.md_content_copy .. " " .. title
    end

    -- Add icon to command
    if command then
        -- Add docker icon
        if command == "docker" or command == "podman" then
            title = nerdfonts.linux_docker .. " " .. title
        end

        -- Add kubernetes icon
        if command == "kind" or command == "kubectl" then
            title = nerdfonts.md_kuberntes .. " " .. title
        end

        -- Add ssh icon
        if command == "ssh" then
            title = nerdfonts.md_remote_desktop .. " " .. title
        end

        -- Add monitoring icon
        if string.match(command, "^([bh]?)top") then
            title = nerdfonts.md_monitor_eye .. " " .. title
        end

        -- Add vim icon
        if string.match(command, "^(n?)vi(m?)") then
            title = nerdfonts.dev_vim .. " " .. title
        end

        -- Add watch icon
        if command == "watch" then
            title = nerdfonts.md_eye_outline .. " " .. title
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
            { Background = { Color = colors.background } },
            { Foreground = { Color = colors.ansi[5] } },
            { Text = title .. " " },
            { Background = { Color = colors.ansi[5] } },
            { Foreground = { Color = colors.background } },
            { Text = " " .. tab_number },
            { Background = { Color = colors.background } },
            { Foreground = { Color = colors.ansi[5] } },
            { Text = nerdfonts.ple_right_half_circle_thick .. " " },
        }
    else
        return {
            { Background = { Color = colors.background } },
            { Foreground = { Color = colors.ansi[1] } },
            { Text = nerdfonts.ple_left_half_circle_thick },
            { Background = { Color = colors.ansi[1] } },
            { Foreground = { Color = colors.foreground } },
            { Text = title .. " " },
            { Background = { Color = colors.indexed[16] } },
            { Foreground = { Color = colors.background } },
            { Text = " " .. tab_number },
            { Background = { Color = colors.background } },
            { Foreground = { Color = colors.indexed[16] } },
            { Text = nerdfonts.ple_right_half_circle_thick .. " " },
        }
    end
end

return status
