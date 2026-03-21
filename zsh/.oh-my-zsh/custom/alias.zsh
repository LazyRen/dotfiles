alias ls="eza"
alias opus='claude --model "opus[1m]" --dangerously-skip-permissions'
alias za='zellij attach'
alias cat='bat'

alias remove_history='history -w; cat ~/.zsh_history | fzf -m > /tmp/to_remove; grep -vxFf /tmp/to_remove ~/.zsh_history > ~/.new_zsh_history; mv ~/.new_zsh_history ~/.zsh_history; rm /tmp/to_remove; history -r; fc -R'
