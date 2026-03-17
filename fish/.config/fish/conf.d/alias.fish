abbr -a ls "eza --icons --group-directories-first"
abbr -a ll "eza -la --icons --group-directories-first"
abbr -a lt "eza --tree --level=2 --icons"

abbr -a cat "bat"

abbr -a za "zellij attach"

# git
abbr -a ga "git add"
abbr -a gaa "git add --all"
abbr -a gb "git branch"
abbr -a gba "git branch -a"
abbr -a gc "git commit"
abbr -a gca "git commit --amend"
abbr -a gcm --set-cursor 'git commit -m "%"'
abbr -a gco "git checkout"
abbr -a gd "git diff"
abbr -a glog "git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd)%C(bold blue)<%an>%Creset' --abbrev-commit"
abbr -a gm "git merge"
abbr -a gp "git push"
abbr -a gpl "git pull"
abbr -a gs "git status"
abbr -a gst "git stash"
abbr -a gstp "git stash pop"
abbr -a gds "git diff --staged"
abbr -a grb "git rebase"
abbr -a grs "git restore"
abbr -a gsw "git switch"
function gresetremote
    git reset --hard origin/(git branch --show-current)
end

function gresetlastcommit
    git reset --hard HEAD~1
end

abbr -a opus 'claude --model "opus[1m]" --dangerously-skip-permissions'
