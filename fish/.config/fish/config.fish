# Initialize Homebrew
for brewpath in /opt/homebrew /usr/local /home/linuxbrew/.linuxbrew
    if test -x $brewpath/bin/brew
        eval ($brewpath/bin/brew shellenv fish)
        break
    end
end

fish_add_path $HOME/.local/bin

if status is-interactive
    zoxide init fish | source
    starship init fish | source
    fzf --fish | source
    atuin init fish | source
    mise activate fish | source
end

set -g fish_greeting ""

# Fish syntax highlighting (powerlevel10k style)
set -g fish_color_autosuggestion brblack
set -g fish_color_cancel -r
set -g fish_color_command green --bold
set -g fish_color_keyword green
set -g fish_color_option cyan
set -g fish_color_comment brblack
set -g fish_color_cwd blue --bold
set -g fish_color_cwd_root red
set -g fish_color_end green
set -g fish_color_error red
set -g fish_color_escape yellow
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_host_remote yellow
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator yellow
set -g fish_color_param normal
set -g fish_color_quote yellow
set -g fish_color_redirection cyan
set -g fish_color_search_match --background=brblack
set -g fish_color_selection white --bold --background=brblack
set -g fish_color_status red
set -g fish_color_user green
set -g fish_color_valid_path --underline

# Fish pager (tab completion menu)
set -g fish_pager_color_completion normal
set -g fish_pager_color_description brblack
set -g fish_pager_color_prefix green --bold --underline
set -g fish_pager_color_progress brblack --background=normal
set -g fish_pager_color_selected_background --background=brblack
set -g fish_pager_color_selected_completion white
set -g fish_pager_color_selected_description brwhite
set -g fish_pager_color_selected_prefix green --bold
