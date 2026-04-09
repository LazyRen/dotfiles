local M = {}

function M.get(c, _)
  return {
    GitSignsAdd = { fg = c.green },
    GitSignsAddLn = { fg = c.green },
    GitSignsAddNr = { fg = c.green },
    GitSignsChange = { fg = c.blue },
    GitSignsChangeLn = { fg = c.blue },
    GitSignsChangeNr = { fg = c.blue },
    GitSignsDelete = { fg = c.red },
    GitSignsDeleteLn = { fg = c.red },
    GitSignsDeleteNr = { fg = c.red },
  }
end

return M
