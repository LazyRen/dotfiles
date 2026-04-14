local c = require("onedark.palette")
local blend = require("onedark.colors").blend

local line_add = blend(c.green, c.bg0, 0.15)
local line_del = blend(c.red, c.bg0, 0.15)
local char_add = blend(c.green, c.bg0, 0.30)
local char_del = blend(c.red, c.bg0, 0.30)

return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",
  opts = {
    highlights = {
      line_insert = line_add,
      line_delete = line_del,
      char_insert = char_add,
      char_delete = char_del,
      conflict_sign = c.orange,
      conflict_sign_resolved = c.grey,
      conflict_sign_accepted = c.green,
      conflict_sign_rejected = c.red,
    },
  },
}
