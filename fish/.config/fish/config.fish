# Initialize Homebrew
for brewpath in /opt/homebrew /usr/local /home/linuxbrew/.linuxbrew
    if test -x $brewpath/bin/brew
        eval ($brewpath/bin/brew shellenv fish)
        break
    end
end

fish_add_path $HOME/.local/bin

# Enable subfolders in functions/completions
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path
set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path

set -g fish_greeting ""

if status is-interactive
    command -q zoxide && zoxide init fish | source
    command -q starship && starship init fish | source
    command -q fzf && fzf --fish | source
    command -q atuin && atuin init fish | source
    command -q mise && mise activate fish | source
end
