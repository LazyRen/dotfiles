local M = {}

function M.get(c, _)
  return {
    -- Filler lines (default = true in plugin)
    CodeDiffFiller = { fg = c.bg3 },

    -- Conflict signs (default = true in plugin)
    CodeDiffConflictSign = { fg = c.orange },
    CodeDiffConflictSignResolved = { fg = c.grey },
    CodeDiffConflictSignAccepted = { fg = c.green },
    CodeDiffConflictSignRejected = { fg = c.red },

    -- Explorer (default = true in plugin)
    CodeDiffExplorerSelected = { bg = c.bg3 },
    CodeDiffStatusAdded = { fg = c.green },
    CodeDiffStatusModified = { fg = c.blue },
    CodeDiffStatusDeleted = { fg = c.red },
    CodeDiffStatusRenamed = { fg = c.cyan },
    CodeDiffStatusUntracked = { fg = c.yellow },
    CodeDiffStatusConflict = { fg = c.orange },
  }
end

return M
