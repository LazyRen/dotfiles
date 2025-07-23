local functions = {}

function functions.tab_title(tab_info)
    local title = tab_info.tab_title
    -- if the tab title is explicitly set, take that
    if title and #title > 0 then
        return title
    end
    -- Otherwise, use the title from the active pane in that tab
    title = tab_info.active_pane.title
    title = string.gsub(title, "^Copy mode: ", "" )
    return title
end

return functions
