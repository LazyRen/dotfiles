-- One Dark lualine theme
-- Colors from lua/onedark/palette.lua (synced with themes/onedark.yaml).

local c = require("onedark.palette")

return {
  inactive = {
    a = { fg = c.grey, bg = c.bg_hl, gui = "bold" },
    b = { fg = c.grey, bg = c.bg_hl },
    c = { fg = c.grey, bg = c.none },
  },
  normal = {
    a = { fg = c.bg0, bg = c.green, gui = "bold" },
    b = { fg = c.fg, bg = c.bg3 },
    c = { fg = c.fg, bg = c.none },
  },
  visual = { a = { fg = c.bg0, bg = c.purple, gui = "bold" } },
  replace = { a = { fg = c.bg0, bg = c.red, gui = "bold" } },
  insert = { a = { fg = c.bg0, bg = c.blue, gui = "bold" } },
  command = { a = { fg = c.bg0, bg = c.yellow, gui = "bold" } },
  terminal = { a = { fg = c.bg0, bg = c.cyan, gui = "bold" } },
}
