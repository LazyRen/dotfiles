function gpg --description "Gerrit push for review"
    if test -n "$argv[1]"
        set branch_name $argv[1]
    else
        set branch_name (git for-each-ref --format='%(upstream:short)' (git symbolic-ref -q HEAD) | cut -d '/' -f2)
    end
    git push origin HEAD:refs/for/$branch_name
end
