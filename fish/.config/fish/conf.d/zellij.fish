function zellij_tab_name_update --on-variable PWD
    set -q ZELLIJ; or return

    set -l tab_name
    if git rev-parse --is-inside-work-tree &>/dev/null
        set -l root (basename (git rev-parse --show-toplevel))
        set -l prefix (string trim -c / (git rev-parse --show-prefix))
        set tab_name $root
        test -n "$prefix"; and set tab_name "$root/$prefix"
    else if test "$PWD" = "$HOME"
        set tab_name "~"
    else
        set tab_name (basename $PWD)
    end

    command zellij action rename-tab $tab_name &>/dev/null &
    disown
end

# Set tab name on shell startup
zellij_tab_name_update
