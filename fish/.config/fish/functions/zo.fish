function zo --description "Open zellij session named after current directory"
    if set -q argv[1]
        z $argv[1]; or return 1
    end
    zellij attach --create (basename $PWD)
end
