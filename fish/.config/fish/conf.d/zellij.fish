function __zellij_tab_dir_name
    if test "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = true
        set -l root (basename (git rev-parse --show-toplevel))
        set -l prefix (string trim -c / (git rev-parse --show-prefix))
        if test -n "$prefix"
            echo "$root/$prefix"
        else
            echo $root
        end
    else if test "$PWD" = "$HOME"
        echo "~"
    else
        basename $PWD
    end
end

function zellij_tab_name_update --on-variable PWD
    set -q ZELLIJ; or return

    set -g __zellij_cmd_tab ""
    command zellij action rename-tab (__zellij_tab_dir_name) &>/dev/null &
    disown
end

function zellij_tab_name_update_preexec --on-event fish_preexec
    set -q ZELLIJ; or return

    set -l title (string split ' ' $argv)[1]
    set -g __zellij_cmd_tab $title
    command zellij action rename-tab $title &>/dev/null &
    disown
end

function zellij_tab_name_update_postexec --on-event fish_postexec
    set -q ZELLIJ; or return

    set -g __zellij_cmd_tab ""
    command zellij action rename-tab (__zellij_tab_dir_name) &>/dev/null &
    disown
end

# Set tab name on shell startup
if set -q ZELLIJ
    command zellij action rename-tab (__zellij_tab_dir_name) &>/dev/null &
    disown
end
