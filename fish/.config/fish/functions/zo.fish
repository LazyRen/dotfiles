function zo --description "Open zellij session named after current directory"
    zellij attach --create (basename $PWD)
end
