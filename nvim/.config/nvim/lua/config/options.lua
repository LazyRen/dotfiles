-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
local o = vim.o

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

o.smarttab = true
o.autoindent = true
o.copyindent = true
o.breakindent = true

if os.getenv("SSH_TTY") then
  -- LazyVim disables clipboard over SSH; re-enable with OSC52 provider
  o.clipboard = "unnamedplus"
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end
