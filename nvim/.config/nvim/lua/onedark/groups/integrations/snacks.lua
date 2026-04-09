local M = {}

function M.get(c, bg)
  return {
    SnacksDashboardHeader = { fg = c.blue },
    SnacksDashboardFooter = { fg = c.dark_red, italic = true },
    SnacksDashboardSpecial = { fg = c.dark_red, bold = true },
    SnacksDashboardDesc = { fg = c.cyan },
    SnacksDashboardIcon = { fg = c.cyan },
    SnacksDashboardKey = { fg = c.blue },
    SnacksPicker = { fg = c.fg, bg = bg },
    SnacksPickerBorder = { fg = c.blue },
    SnacksPickerTitle = { fg = c.purple },
    SnacksPickerMatch = { fg = c.orange, bold = true },
    SnacksIndent = { fg = c.bg_hl },
    SnacksIndent1 = { fg = c.red },
    SnacksIndent2 = { fg = c.orange },
    SnacksIndent3 = { fg = c.yellow },
    SnacksIndent4 = { fg = c.green },
    SnacksIndent5 = { fg = c.blue },
    SnacksIndent6 = { fg = c.purple },
    SnacksIndent7 = { fg = c.cyan },
    SnacksIndentScope = { fg = c.yellow },
  }
end

return M
