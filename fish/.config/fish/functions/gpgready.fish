function gpgready --description "Gerrit amend and push as ready"
    if test -n "$argv[1]"
        set branch_name $argv[1]
    else
        set branch_name (git for-each-ref --format='%(upstream:short)' (git symbolic-ref -q HEAD) | cut -d '/' -f2)
    end
    git commit --amend --no-edit
    git push origin HEAD:refs/for/$branch_name%ready
end
