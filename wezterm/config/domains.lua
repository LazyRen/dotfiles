local wezterm = require "wezterm"
local mod = {}

mod.default_workspace = "local"

mod.ssh_domains = {}
for host, contents in pairs(wezterm.enumerate_ssh_hosts()) do
    table.insert(mod.ssh_domains, {
        name = host,
        remote_address = contents.hostname,
        username = contents.user,
        ssh_option = { identityfile = contents.identityfile },
        local_echo_threshold_ms = 50000,
        assume_shell = "Posix"
    })
end

mod.wsl_domains = {}

return mod
