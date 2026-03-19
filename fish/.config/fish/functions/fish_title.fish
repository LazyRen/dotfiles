function fish_title
    if test -n "$argv"
        echo $argv
    else
        prompt_pwd
    end
end
