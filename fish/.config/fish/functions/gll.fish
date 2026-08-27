function gll --description "Show last commit for each worktree: name[:branch]  message"
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Not in a git repository"
        return 1
    end

    set -l wt_paths (git worktree list --porcelain | string match 'worktree *' | string replace 'worktree ' '')

    set -l labels
    set -l messages
    set -l max_len 0

    for wt_path in $wt_paths
        set -l name (basename $wt_path)
        set -l branch (git -C $wt_path branch --show-current 2>/dev/null)
        set -l upstream (git -C $wt_path rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
        if test -n "$upstream"
            set branch (string replace -r '^[^/]+/' '' -- $upstream)
        end

        set -l label "$name:$branch"
        if test "$name" = "$branch"
            set label $name
        end

        set -l msg (git -C $wt_path log -1 --format="%s" 2>/dev/null)
        set -l truncated (string sub -l 80 -- $msg)
        if test (string length -- $msg) -gt 80
            set truncated "$truncated..."
        end

        set labels $labels $label
        set messages $messages $truncated

        set -l len (string length -- "$label")
        if test "$len" -gt "$max_len"
            set max_len $len
        end
    end

    for i in (seq (count $labels))
        printf "%-*s  %s\n" $max_len $labels[$i] $messages[$i]
    end
end
