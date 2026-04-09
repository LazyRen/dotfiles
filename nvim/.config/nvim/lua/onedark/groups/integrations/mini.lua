local M = {}

function M.get(c, bg)
  return {
    MiniAnimateCursor = { reverse = true, nocombine = true },
    MiniAnimateNormalFloat = { link = "NormalFloat" },

    MiniClueBorder = { link = "FloatBorder" },
    MiniClueDescGroup = { link = "DiagnosticWarn" },
    MiniClueDescSingle = { link = "NormalFloat" },
    MiniClueNextKey = { link = "DiagnosticHint" },
    MiniClueNextKeyWithPostkeys = { link = "DiagnosticError" },
    MiniClueSeparator = { link = "DiagnosticInfo" },
    MiniClueTitle = { fg = c.cyan },

    MiniCompletionActiveParameter = { underline = true },

    MiniCursorword = { underline = true },
    MiniCursorwordCurrent = { underline = true },

    MiniDepsChangeAdded = { link = "Added" },
    MiniDepsChangeRemoved = { link = "Removed" },
    MiniDepsHint = { link = "DiagnosticHint" },
    MiniDepsInfo = { link = "DiagnosticInfo" },
    MiniDepsMsgBreaking = { link = "DiagnosticWarn" },
    MiniDepsPlaceholder = { link = "Comment" },
    MiniDepsTitle = { link = "Title" },
    MiniDepsTitleError = { link = "DiffDelete" },
    MiniDepsTitleSame = { link = "DiffText" },
    MiniDepsTitleUpdate = { link = "DiffAdd" },

    MiniDiffSignAdd = { fg = c.green },
    MiniDiffSignChange = { fg = c.blue },
    MiniDiffSignDelete = { fg = c.red },
    MiniDiffOverAdd = { link = "DiffAdd" },
    MiniDiffOverChange = { link = "DiffText" },
    MiniDiffOverContext = { link = "DiffChange" },
    MiniDiffOverDelete = { link = "DiffDelete" },

    MiniFilesBorder = { link = "FloatBorder" },
    MiniFilesBorderModified = { link = "DiagnosticWarn" },
    MiniFilesCursorLine = { bg = c.bg1 },
    MiniFilesDirectory = { link = "Directory" },
    MiniFilesFile = { fg = c.fg },
    MiniFilesNormal = { link = "NormalFloat" },
    MiniFilesTitle = { fg = c.cyan },
    MiniFilesTitleFocused = { fg = c.cyan, bold = true },

    MiniHipatternsFixme = { fg = c.bg0, bg = c.red, bold = true },
    MiniHipatternsHack = { fg = c.bg0, bg = c.yellow, bold = true },
    MiniHipatternsNote = { fg = c.bg0, bg = c.cyan, bold = true },
    MiniHipatternsTodo = { fg = c.bg0, bg = c.purple, bold = true },

    MiniIconsAzure = { fg = c.blue },
    MiniIconsBlue = { fg = c.blue },
    MiniIconsCyan = { fg = c.cyan },
    MiniIconsGreen = { fg = c.green },
    MiniIconsGrey = { fg = c.fg },
    MiniIconsOrange = { fg = c.orange },
    MiniIconsPurple = { fg = c.purple },
    MiniIconsRed = { fg = c.red },
    MiniIconsYellow = { fg = c.yellow },

    MiniIndentscopeSymbol = { fg = c.grey },
    MiniIndentscopePrefix = { nocombine = true },

    MiniJump = { fg = c.purple, underline = true, sp = c.purple },

    MiniJump2dDim = { fg = c.grey, nocombine = true },
    MiniJump2dSpot = { fg = c.red, bold = true, nocombine = true },
    MiniJump2dSpotAhead = { fg = c.cyan, bg = c.bg0, nocombine = true },
    MiniJump2dSpotUnique = { fg = c.yellow, bold = true, nocombine = true },

    MiniMapNormal = { link = "NormalFloat" },
    MiniMapSymbolCount = { link = "Special" },
    MiniMapSymbolLine = { link = "Title" },
    MiniMapSymbolView = { link = "Delimiter" },

    MiniNotifyBorder = { link = "FloatBorder" },
    MiniNotifyNormal = { link = "NormalFloat" },
    MiniNotifyTitle = { fg = c.cyan },

    MiniOperatorsExchangeFrom = { link = "IncSearch" },

    MiniPickBorder = { link = "FloatBorder" },
    MiniPickBorderBusy = { link = "DiagnosticWarn" },
    MiniPickBorderText = { fg = c.cyan, bold = true },
    MiniPickIconDirectory = { link = "Directory" },
    MiniPickIconFile = { link = "NormalFloat" },
    MiniPickHeader = { link = "DiagnosticHint" },
    MiniPickMatchCurrent = { bg = c.bg1 },
    MiniPickMatchMarked = { bg = c.bg1 },
    MiniPickMatchRanges = { link = "DiagnosticHint" },
    MiniPickNormal = { link = "NormalFloat" },
    MiniPickPreviewLine = { bg = c.bg1 },
    MiniPickPreviewRegion = { link = "IncSearch" },
    MiniPickPrompt = { link = "DiagnosticInfo" },

    MiniStarterCurrent = { nocombine = true },
    MiniStarterFooter = { fg = c.dark_red, italic = true },
    MiniStarterHeader = { fg = c.yellow },
    MiniStarterInactive = { fg = c.grey, italic = true },
    MiniStarterItem = { fg = c.fg, bg = bg },
    MiniStarterItemBullet = { fg = c.grey },
    MiniStarterItemPrefix = { fg = c.yellow },
    MiniStarterSection = { fg = c.white },
    MiniStarterQuery = { fg = c.cyan },

    MiniStatuslineDevinfo = { fg = c.fg, bg = c.bg1 },
    MiniStatuslineFileinfo = { fg = c.fg, bg = c.bg1 },
    MiniStatuslineFilename = { fg = c.grey, bg = c.bg_hl },
    MiniStatuslineInactive = { link = "StatusLineNC" },
    MiniStatuslineModeCommand = { fg = c.bg0, bg = c.yellow, bold = true },
    MiniStatuslineModeInsert = { fg = c.bg0, bg = c.blue, bold = true },
    MiniStatuslineModeNormal = { fg = c.bg0, bg = c.green, bold = true },
    MiniStatuslineModeOther = { fg = c.bg0, bg = c.cyan, bold = true },
    MiniStatuslineModeReplace = { fg = c.bg0, bg = c.red, bold = true },
    MiniStatuslineModeVisual = { fg = c.bg0, bg = c.purple, bold = true },

    MiniSurround = { fg = c.bg0, bg = c.orange },

    MiniTablineCurrent = { bold = true },
    MiniTablineFill = { fg = c.grey, bg = c.bg_hl },
    MiniTablineHidden = { fg = c.fg, bg = c.bg_hl },
    MiniTablineModifiedCurrent = { fg = c.orange, bold = true, italic = true },
    MiniTablineModifiedHidden = { fg = c.white, bg = c.bg_hl, italic = true },
    MiniTablineModifiedVisible = { fg = c.yellow, bg = c.bg0, italic = true },
    MiniTablineTabpagesection = { fg = c.bg0, bg = c.yellow },
    MiniTablineVisible = { fg = c.white, bg = c.bg0 },

    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = c.red, bold = true },
    MiniTestPass = { fg = c.green, bold = true },

    MiniTrailspace = { bg = c.red },
  }
end

return M
