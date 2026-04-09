local M = {}

function M.get(c, _)
  return {
    IblIndent = { fg = c.bg_hl, nocombine = true },
    IblWhitespace = { fg = c.bg_hl, nocombine = true },
    IblScope = { fg = c.purple, nocombine = true },

    RainbowDelimiterRed = { fg = c.red },
    RainbowDelimiterYellow = { fg = c.yellow },
    RainbowDelimiterBlue = { fg = c.blue },
    RainbowDelimiterOrange = { fg = c.orange },
    RainbowDelimiterGreen = { fg = c.green },
    RainbowDelimiterViolet = { fg = c.purple },
    RainbowDelimiterCyan = { fg = c.cyan },
  }
end

return M
