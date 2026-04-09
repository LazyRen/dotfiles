local M = {}

function M.get(c, _)
  return {
    DiagnosticError = { fg = c.red },
    DiagnosticHint = { fg = c.purple },
    DiagnosticInfo = { fg = c.cyan },
    DiagnosticWarn = { fg = c.yellow },
    DiagnosticOk = { fg = c.green },
    DiagnosticUnnecessary = { fg = c.grey },
    DiagnosticDeprecated = { fg = c.orange, strikethrough = true },

    DiagnosticVirtualTextError = { fg = c.red },
    DiagnosticVirtualTextWarn = { fg = c.yellow },
    DiagnosticVirtualTextInfo = { fg = c.cyan },
    DiagnosticVirtualTextHint = { fg = c.purple },
    DiagnosticVirtualTextOk = { fg = c.green },
    DiagnosticVirtualTextUnnecessary = { fg = c.grey },
    DiagnosticVirtualTextDeprecated = { fg = c.orange, strikethrough = true },

    DiagnosticUnderlineError = { undercurl = true, sp = c.red },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.purple },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow },
    DiagnosticUnderlineOk = { undercurl = true, sp = c.green },
    DiagnosticUnderlineUnnecessary = { undercurl = true, sp = c.grey },
    DiagnosticUnderlineDeprecated = { strikethrough = true, sp = c.orange },

    LspReferenceText = { bg = c.grey },
    LspReferenceWrite = { bg = c.grey },
    LspReferenceRead = { bg = c.grey },
    LspCodeLens = { fg = c.grey, italic = true },
    LspCodeLensSeparator = { fg = c.grey },
  }
end

return M
