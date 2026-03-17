function code --description "Open VS Code (works outside VS Code terminal)"
    # Find the most recent VSCode server folder (excluding .staging)
    set -l script (ls -td ~/.vscode-server/cli/servers/*/server/bin/remote-cli/code 2>/dev/null | string match -rv '\.staging' | head -n1)

    if not test -x "$script"
        echo "VSCode remote CLI not found"
        return 1
    end

    # Find VSCode IPC socket files sorted by change time (newest first)
    set -l sockets (ls -tc /run/user/(id -u)/vscode-ipc-*.sock 2>/dev/null)

    if test (count $sockets) -eq 0
        echo "No VSCode IPC sockets found"
        return 1
    end

    # Try each socket until one works
    for socket in $sockets
        set -lx VSCODE_IPC_HOOK_CLI $socket
        if $script $argv >/dev/null 2>&1
            return 0
        end
    end

    echo "Failed to find valid VS Code window"
    return 1
end
