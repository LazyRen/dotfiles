function zo --description "Open zellij session named after current directory"
    if set -q argv[1]
        set -l result (command zoxide query -- $argv 2>/dev/null)
        if test $status -ne 0
            echo "zoxide: no match for '$argv'" >&2
            return 1
        end
        builtin cd $result
    end
    zellij attach --create (basename $PWD)
end
