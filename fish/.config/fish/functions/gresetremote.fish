function gresetremote --description "Reset to remote branch"
    git reset --hard origin/(git branch --show-current)
end
