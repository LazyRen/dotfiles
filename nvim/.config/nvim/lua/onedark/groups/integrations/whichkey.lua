local M = {}

function M.get(c, _)
  return {
    WhichKey = { fg = c.red },
    WhichKeyDesc = { fg = c.blue },
    WhichKeyGroup = { fg = c.orange },
    WhichKeySeparator = { fg = c.green },
  }
end

return M
