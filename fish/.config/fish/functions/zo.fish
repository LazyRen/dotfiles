function zo --description "Open zellij session named after current directory"
    if set -q argv[1]
        set -l z_output (z $argv[1] 2>&1)
        if test $status -ne 0
            if string match -q '*already in the only match*' "$z_output"
                # already in the target directory, continue
            else
                echo $z_output >&2
                return 1
            end
        end
    end
    zellij attach --create (basename $PWD)
end
