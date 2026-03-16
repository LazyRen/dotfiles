alias ls="eza"
alias opus='claude --model "opus[1m]" --dangerously-skip-permissions'
alias za='zellij attach'
alias cat='bat'

alias remove_history='history -w; cat ~/.zsh_history | fzf -m > /tmp/to_remove; grep -vxFf /tmp/to_remove ~/.zsh_history > ~/.new_zsh_history; mv ~/.new_zsh_history ~/.zsh_history; rm /tmp/to_remove; history -r; fc -R'

# Dev server specific
# alias devadm='sudo su - devadm'

# recompile() {
#     session_name=$(tmux display-message -p '#S');
#     profile="ClangOptimizedMold";
#     echo -e "dbsp\n" | wezterm cli send-text --pane-id $(wezterm cli get-pane-direction next) --no-paste
#     if hdbcc hm b -b $profile -j 500 all_core; then
#         sudo $(git rev-parse --show-toplevel)/tools/bin/updateinstance.sh DEV 00;
#         echo -e "dbre\n" | wezterm cli send-text --pane-id $(wezterm cli get-pane-direction next) --no-paste
#         if [[ $# -ne 0 ]]; then
#             echo -e "$*\n" | wezterm cli send-text --pane-id $(wezterm cli get-pane-direction next) --no-paste
#         fi
#     fi
# }
