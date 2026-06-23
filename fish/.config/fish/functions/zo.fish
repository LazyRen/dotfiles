function zo --description "Open zellij session named after current directory"
    if set -q argv[1]
        set -l result (command zoxide query -- $argv 2>/dev/null)
        or begin
            echo "zoxide: no match for '$argv'" >&2
            return 1
        end
        builtin cd $result; or return 1
    end
    zellij attach --create (basename $PWD)
end
