abbr -a ls "eza --icons --group-directories-first"
abbr -a ll "eza -la --icons --group-directories-first"
abbr -a lt "eza --tree --level=2 --icons"

abbr -a cat bat

abbr -a vim nvim
abbr -a vi nvim

abbr -a za "zellij attach -c"
abbr -a zat 'zellij attach $(zellij ls -s | fzf)'
abbr -a zda "zellij delete-all-sessions"
abbr -a zka "zellij kill-all-sessions"

abbr -a ff spacelist

abbr -a gaa "git add --all"
abbr -a gc "git commit"
abbr -a gca "git commit --amend"
abbr -a gcm --set-cursor 'git commit -m "%"'
abbr -a gcpc "git cherry-pick --continue"
abbr -a gcpa "git cherry-pick --abort"
abbr -a gds "git-forgit diff --staged"
abbr -a gl "git log --color --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cd)%C(bold blue) <%an>%Creset' --abbrev-commit --date=short"
abbr -a gm "git merge"
abbr -a gp "git push"
abbr -a gpl "git pull"
abbr -a grbc "git rebase --continue"
abbr -a grba "git rebase --abort"
abbr -a gresetlastcommit "git reset --hard HEAD~1"
abbr -a gresetremote 'git reset --hard @{u}'
abbr -a grs "git restore"
abbr -a grss "git restore --staged"
abbr -a gs "git status"

abbr -a wts "wt switch"
abbr -a wtsc "wt switch --create"
abbr -a wtl "wt list"
abbr -a wtr "wt remove"
abbr -a wtm "wt merge"

abbr -a opus 'claude --model "opus[1m]" --dangerously-skip-permissions'
