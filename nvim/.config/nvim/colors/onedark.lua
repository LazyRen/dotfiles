-- One Dark colorscheme for Neovim
-- Ported from navarasu/onedark.nvim using the canonical palette.
-- Colors defined in lua/onedark/palette.lua (synced with themes/onedark.yaml).

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "onedark"

local c = require("onedark.palette")

local bg = c.none -- transparent

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ============================================================
-- Core Editor
-- ============================================================
hi("Normal", { fg = c.fg, bg = bg })
hi("Terminal", { fg = c.fg, bg = bg })
hi("EndOfBuffer", { fg = c.bg0, bg = bg })
hi("FoldColumn", { fg = c.fg, bg = bg })
hi("Folded", { fg = c.fg, bg = bg })
hi("SignColumn", { fg = c.fg, bg = bg })
hi("ToolbarLine", { fg = c.fg })
hi("Cursor", { reverse = true })
hi("vCursor", { reverse = true })
hi("iCursor", { reverse = true })
hi("lCursor", { reverse = true })
hi("CursorIM", { reverse = true })
hi("CursorColumn", { bg = c.bg_hl })
hi("CursorLine", { bg = c.bg_hl })
hi("ColorColumn", { bg = c.bg_hl })
hi("CursorLineNr", { fg = c.fg })
hi("LineNr", { fg = c.grey })
hi("Conceal", { fg = c.grey, bg = c.bg_hl })
hi("Added", { fg = c.green })
hi("Removed", { fg = c.red })
hi("Changed", { fg = c.blue })
hi("DiffAdd", { bg = c.bg1 })
hi("DiffChange", { bg = c.bg1 })
hi("DiffDelete", { bg = c.bg1 })
hi("DiffText", { bg = c.bg1 })
hi("DiffAdded", { fg = c.green })
hi("DiffChanged", { fg = c.blue })
hi("DiffRemoved", { fg = c.red })
hi("DiffDeleted", { fg = c.red })
hi("DiffFile", { fg = c.cyan })
hi("DiffIndexLine", { fg = c.grey })
hi("Directory", { fg = c.blue })
hi("ErrorMsg", { fg = c.red, bold = true })
hi("WarningMsg", { fg = c.yellow, bold = true })
hi("MoreMsg", { fg = c.blue, bold = true })
hi("CurSearch", { fg = c.bg0, bg = c.orange })
hi("IncSearch", { fg = c.bg0, bg = c.orange })
hi("Search", { fg = c.fg, bg = c.bg3 })
hi("Substitute", { fg = c.bg0, bg = c.green })
hi("MatchParen", { bg = c.bg3 })
hi("NonText", { fg = c.grey })
hi("Whitespace", { fg = c.grey })
hi("SpecialKey", { fg = c.grey })
hi("Pmenu", { fg = c.fg, bg = c.bg_hl })
hi("PmenuSbar", { bg = c.bg_hl })
hi("PmenuSel", { fg = c.bg0, bg = c.blue })
hi("WildMenu", { fg = c.bg0, bg = c.blue })
hi("PmenuThumb", { bg = c.grey })
hi("Question", { fg = c.yellow })
hi("SpellBad", { undercurl = true, sp = c.red })
hi("SpellCap", { undercurl = true, sp = c.yellow })
hi("SpellLocal", { undercurl = true, sp = c.blue })
hi("SpellRare", { undercurl = true, sp = c.purple })
hi("StatusLine", { bg = bg })
hi("StatusLineTerm", { fg = c.fg, bg = c.bg1 })
hi("StatusLineNC", { bg = bg })
hi("StatusLineTermNC", { fg = c.grey, bg = c.bg_hl })
hi("TabLine", { fg = c.fg, bg = c.bg_hl })
hi("TabLineFill", { fg = c.grey, bg = c.bg_hl })
hi("TabLineSel", { fg = c.bg0, bg = c.fg })
hi("WinSeparator", { fg = c.bg3 })
hi("Visual", { bg = c.bg3 })
hi("VisualNOS", { bg = c.bg1, underline = true })
hi("QuickFixLine", { fg = c.blue, underline = true })
hi("Debug", { fg = c.yellow })
hi("debugPC", { fg = c.bg0, bg = c.green })
hi("debugBreakpoint", { fg = c.bg0, bg = c.red })
hi("ToolbarButton", { fg = c.bg0, bg = c.blue })
hi("FloatBorder", { fg = c.grey, bg = c.bg_hl })
hi("NormalFloat", { fg = c.fg, bg = c.bg_hl })
hi("WinBar", { fg = c.fg, bg = bg })
hi("WinBarNC", { fg = c.grey, bg = bg })

-- ============================================================
-- Syntax
-- ============================================================
hi("String", { fg = c.green })
hi("Character", { fg = c.orange })
hi("Number", { fg = c.orange })
hi("Float", { fg = c.orange })
hi("Boolean", { fg = c.orange })
hi("Type", { fg = c.yellow })
hi("Structure", { fg = c.yellow })
hi("StorageClass", { fg = c.yellow })
hi("Identifier", { fg = c.red })
hi("Constant", { fg = c.cyan })
hi("PreProc", { fg = c.purple })
hi("PreCondit", { fg = c.purple })
hi("Include", { fg = c.purple })
hi("Keyword", { fg = c.purple })
hi("Define", { fg = c.purple })
hi("Typedef", { fg = c.yellow })
hi("Exception", { fg = c.purple })
hi("Conditional", { fg = c.purple })
hi("Repeat", { fg = c.purple })
hi("Statement", { fg = c.purple })
hi("Macro", { fg = c.red })
hi("Error", { fg = c.purple })
hi("Label", { fg = c.purple })
hi("Special", { fg = c.red })
hi("SpecialChar", { fg = c.red })
hi("Function", { fg = c.blue })
hi("Operator", { fg = c.purple })
hi("Title", { fg = c.cyan })
hi("Tag", { fg = c.green })
hi("Delimiter", { fg = c.white })
hi("Comment", { fg = c.grey, italic = true })
hi("SpecialComment", { fg = c.grey, italic = true })
hi("Todo", { fg = c.red, italic = true })

-- ============================================================
-- Treesitter
-- ============================================================

-- Attributes
hi("@attribute", { fg = c.cyan })
hi("@attribute.builtin", { fg = c.blue })

-- Primitives
hi("@boolean", { fg = c.orange })
hi("@character", { fg = c.orange })
hi("@character.special", { fg = c.red })
hi("@number", { fg = c.orange })
hi("@number.float", { fg = c.orange })

-- Comments
hi("@comment", { fg = c.grey, italic = true })
hi("@comment.documentation", { fg = c.grey, italic = true })
hi("@comment.error", { fg = c.red, italic = true })
hi("@comment.note", { fg = c.blue, italic = true })
hi("@comment.todo", { fg = c.purple, italic = true })
hi("@comment.warning", { fg = c.yellow, italic = true })

-- Constants
hi("@constant", { fg = c.orange })
hi("@constant.builtin", { fg = c.orange })
hi("@constant.macro", { fg = c.orange })

-- Constructors
hi("@constructor", { fg = c.yellow, bold = true })

-- Diffs
hi("@diff.plus", { fg = c.green })
hi("@diff.minus", { fg = c.red })
hi("@diff.delta", { fg = c.blue })

-- Functions
hi("@function", { fg = c.blue })
hi("@function.builtin", { fg = c.cyan })
hi("@function.call", { fg = c.blue })
hi("@function.macro", { fg = c.cyan })
hi("@function.method", { fg = c.blue })
hi("@function.method.call", { fg = c.blue })

-- Keywords
hi("@keyword", { fg = c.purple })
hi("@keyword.conditional", { fg = c.purple })
hi("@keyword.conditional.ternary", { fg = c.purple })
hi("@keyword.coroutine", { fg = c.purple })
hi("@keyword.debug", { fg = c.red })
hi("@keyword.directive", { fg = c.purple })
hi("@keyword.directive.define", { fg = c.purple })
hi("@keyword.exception", { fg = c.purple })
hi("@keyword.function", { fg = c.purple })
hi("@keyword.import", { fg = c.purple })
hi("@keyword.modifier", { fg = c.purple })
hi("@keyword.operator", { fg = c.purple })
hi("@keyword.repeat", { fg = c.purple })
hi("@keyword.return", { fg = c.purple })
hi("@keyword.type", { fg = c.purple })

-- Labels
hi("@label", { fg = c.red })

-- Markup
hi("@markup.strong", { fg = c.fg, bold = true })
hi("@markup.italic", { fg = c.fg, italic = true })
hi("@markup.strikethrough", { fg = c.fg, strikethrough = true })
hi("@markup.underline", { fg = c.fg, underline = true })
hi("@markup.heading", { fg = c.orange, bold = true })
hi("@markup.heading.1", { fg = c.red, bold = true })
hi("@markup.heading.2", { fg = c.purple, bold = true })
hi("@markup.heading.3", { fg = c.orange, bold = true })
hi("@markup.heading.4", { fg = c.red, bold = true })
hi("@markup.heading.5", { fg = c.purple, bold = true })
hi("@markup.heading.6", { fg = c.orange, bold = true })
hi("@markup.link", { fg = c.blue })
hi("@markup.link.label", { fg = c.cyan })
hi("@markup.link.url", { fg = c.cyan, underline = true })
hi("@markup.list", { fg = c.red })
hi("@markup.list.checked", { fg = c.green, italic = true })
hi("@markup.list.unchecked", { fg = c.red, italic = true })
hi("@markup.math", { fg = c.fg })
hi("@markup.quote", { fg = c.grey, italic = true })
hi("@markup.raw", { fg = c.green })
hi("@markup.raw.block", { fg = c.green })

-- Modules
hi("@module", { fg = c.yellow })
hi("@module.builtin", { fg = c.orange })

-- Misc
hi("@none", { fg = c.fg })
hi("@conceal", { fg = c.grey })

-- Operators
hi("@operator", { fg = c.fg })

-- Properties
hi("@property", { fg = c.cyan })

-- Punctuation
hi("@punctuation.bracket", { fg = c.white })
hi("@punctuation.delimiter", { fg = c.white })
hi("@punctuation.special", { fg = c.red })

-- Strings
hi("@string", { fg = c.green })
hi("@string.documentation", { fg = c.green })
hi("@string.escape", { fg = c.red })
hi("@string.regexp", { fg = c.orange })
hi("@string.special", { fg = c.cyan })
hi("@string.special.path", { fg = c.green })
hi("@string.special.symbol", { fg = c.cyan })
hi("@string.special.url", { fg = c.cyan, underline = true })

-- Tags
hi("@tag", { fg = c.purple })
hi("@tag.builtin", { fg = c.purple })
hi("@tag.attribute", { fg = c.yellow })
hi("@tag.delimiter", { fg = c.purple })

-- Types
hi("@type", { fg = c.yellow })
hi("@type.builtin", { fg = c.orange })
hi("@type.definition", { fg = c.yellow })

-- Variables
hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = c.red })
hi("@variable.member", { fg = c.cyan })
hi("@variable.parameter", { fg = c.red })
hi("@variable.parameter.builtin", { fg = c.orange })

-- ============================================================
-- LSP Semantic Tokens
-- ============================================================
hi("@lsp.type.comment", { link = "@comment" })
hi("@lsp.type.enum", { link = "@type" })
hi("@lsp.type.enumMember", { link = "@constant.builtin" })
hi("@lsp.type.interface", { link = "@type" })
hi("@lsp.type.typeParameter", { link = "@type" })
hi("@lsp.type.keyword", { link = "@keyword" })
hi("@lsp.type.namespace", { link = "@module" })
hi("@lsp.type.parameter", { link = "@variable.parameter" })
hi("@lsp.type.property", { link = "@property" })
hi("@lsp.type.variable", { link = "@variable" })
hi("@lsp.type.macro", { link = "@function.macro" })
hi("@lsp.type.method", { link = "@function.method" })
hi("@lsp.type.number", { link = "@number" })
hi("@lsp.type.generic", { link = "@variable" })
hi("@lsp.type.builtinType", { link = "@type.builtin" })
hi("@lsp.typemod.method.defaultLibrary", { link = "@function" })
hi("@lsp.typemod.function.defaultLibrary", { link = "@function" })
hi("@lsp.typemod.operator.injected", { link = "@operator" })
hi("@lsp.typemod.string.injected", { link = "@string" })
hi("@lsp.typemod.variable.defaultLibrary", { link = "@variable.builtin" })
hi("@lsp.typemod.variable.injected", { link = "@variable" })
hi("@lsp.typemod.variable.static", { link = "@constant" })

-- ============================================================
-- Diagnostics
-- ============================================================
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticHint", { fg = c.purple })
hi("DiagnosticInfo", { fg = c.cyan })
hi("DiagnosticWarn", { fg = c.yellow })
hi("DiagnosticOk", { fg = c.green })
hi("DiagnosticUnnecessary", { fg = c.grey })
hi("DiagnosticDeprecated", { fg = c.orange, strikethrough = true })

hi("DiagnosticVirtualTextError", { fg = c.red })
hi("DiagnosticVirtualTextWarn", { fg = c.yellow })
hi("DiagnosticVirtualTextInfo", { fg = c.cyan })
hi("DiagnosticVirtualTextHint", { fg = c.purple })
hi("DiagnosticVirtualTextOk", { fg = c.green })
hi("DiagnosticVirtualTextUnnecessary", { fg = c.grey })
hi("DiagnosticVirtualTextDeprecated", { fg = c.orange, strikethrough = true })

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.purple })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineOk", { undercurl = true, sp = c.green })
hi("DiagnosticUnderlineUnnecessary", { undercurl = true, sp = c.grey })
hi("DiagnosticUnderlineDeprecated", { strikethrough = true, sp = c.orange })

hi("LspReferenceText", { bg = c.bg1 })
hi("LspReferenceWrite", { bg = c.bg1 })
hi("LspReferenceRead", { bg = c.bg1 })
hi("LspCodeLens", { fg = c.grey, italic = true })
hi("LspCodeLensSeparator", { fg = c.grey })

-- ============================================================
-- Plugin: Blink.cmp
-- ============================================================
hi("BlinkCmpLabel", { fg = c.fg })
hi("BlinkCmpLabelDeprecated", { fg = c.white, strikethrough = true })
hi("BlinkCmpLabelMatch", { fg = c.cyan })
hi("BlinkCmpDetail", { fg = c.white })
hi("BlinkCmpKind", { fg = c.purple })

-- BlinkCmpKind variants
local lsp_kind_colors = {
  Array = c.yellow, Boolean = c.orange, Class = c.yellow,
  Color = c.green, Constant = c.orange, Constructor = c.blue,
  Enum = c.purple, EnumMember = c.yellow, Event = c.yellow,
  Field = c.purple, File = c.blue, Folder = c.orange,
  Function = c.blue, Interface = c.green, Key = c.cyan,
  Keyword = c.cyan, Method = c.blue, Module = c.orange,
  Namespace = c.red, Null = c.grey, Number = c.orange,
  Object = c.red, Operator = c.red, Package = c.yellow,
  Property = c.cyan, Reference = c.orange, Snippet = c.red,
  String = c.green, Struct = c.purple, Text = c.white,
  TypeParameter = c.red, Unit = c.green, Value = c.orange,
  Variable = c.purple,
}

for kind, color in pairs(lsp_kind_colors) do
  hi("BlinkCmpKind" .. kind, { fg = color })
end

-- ============================================================
-- Plugin: GitSigns
-- ============================================================
hi("GitSignsAdd", { fg = c.green })
hi("GitSignsAddLn", { fg = c.green })
hi("GitSignsAddNr", { fg = c.green })
hi("GitSignsChange", { fg = c.blue })
hi("GitSignsChangeLn", { fg = c.blue })
hi("GitSignsChangeNr", { fg = c.blue })
hi("GitSignsDelete", { fg = c.red })
hi("GitSignsDeleteLn", { fg = c.red })
hi("GitSignsDeleteNr", { fg = c.red })

-- ============================================================
-- Plugin: Snacks
-- ============================================================
hi("SnacksDashboardHeader", { fg = c.blue })
hi("SnacksDashboardFooter", { fg = c.dark_red, italic = true })
hi("SnacksDashboardSpecial", { fg = c.dark_red, bold = true })
hi("SnacksDashboardDesc", { fg = c.cyan })
hi("SnacksDashboardIcon", { fg = c.cyan })
hi("SnacksDashboardKey", { fg = c.blue })
hi("SnacksPicker", { fg = c.fg, bg = bg })
hi("SnacksPickerBorder", { fg = c.cyan })
hi("SnacksPickerTitle", { fg = c.red })
hi("SnacksPickerMatch", { fg = c.orange, bold = true })

-- ============================================================
-- Plugin: Which-Key
-- ============================================================
hi("WhichKey", { fg = c.red })
hi("WhichKeyDesc", { fg = c.blue })
hi("WhichKeyGroup", { fg = c.orange })
hi("WhichKeySeparator", { fg = c.green })

-- ============================================================
-- Plugin: Mini
-- ============================================================
hi("MiniAnimateCursor", { reverse = true, nocombine = true })
hi("MiniAnimateNormalFloat", { link = "NormalFloat" })

hi("MiniClueBorder", { link = "FloatBorder" })
hi("MiniClueDescGroup", { link = "DiagnosticWarn" })
hi("MiniClueDescSingle", { link = "NormalFloat" })
hi("MiniClueNextKey", { link = "DiagnosticHint" })
hi("MiniClueNextKeyWithPostkeys", { link = "DiagnosticError" })
hi("MiniClueSeparator", { link = "DiagnosticInfo" })
hi("MiniClueTitle", { fg = c.cyan })

hi("MiniCompletionActiveParameter", { underline = true })

hi("MiniCursorword", { underline = true })
hi("MiniCursorwordCurrent", { underline = true })

hi("MiniDepsChangeAdded", { link = "Added" })
hi("MiniDepsChangeRemoved", { link = "Removed" })
hi("MiniDepsHint", { link = "DiagnosticHint" })
hi("MiniDepsInfo", { link = "DiagnosticInfo" })
hi("MiniDepsMsgBreaking", { link = "DiagnosticWarn" })
hi("MiniDepsPlaceholder", { link = "Comment" })
hi("MiniDepsTitle", { link = "Title" })
hi("MiniDepsTitleError", { link = "DiffDelete" })
hi("MiniDepsTitleSame", { link = "DiffText" })
hi("MiniDepsTitleUpdate", { link = "DiffAdd" })

hi("MiniDiffSignAdd", { fg = c.green })
hi("MiniDiffSignChange", { fg = c.blue })
hi("MiniDiffSignDelete", { fg = c.red })
hi("MiniDiffOverAdd", { link = "DiffAdd" })
hi("MiniDiffOverChange", { link = "DiffText" })
hi("MiniDiffOverContext", { link = "DiffChange" })
hi("MiniDiffOverDelete", { link = "DiffDelete" })

hi("MiniFilesBorder", { link = "FloatBorder" })
hi("MiniFilesBorderModified", { link = "DiagnosticWarn" })
hi("MiniFilesCursorLine", { bg = c.bg1 })
hi("MiniFilesDirectory", { link = "Directory" })
hi("MiniFilesFile", { fg = c.fg })
hi("MiniFilesNormal", { link = "NormalFloat" })
hi("MiniFilesTitle", { fg = c.cyan })
hi("MiniFilesTitleFocused", { fg = c.cyan, bold = true })

hi("MiniHipatternsFixme", { fg = c.bg0, bg = c.red, bold = true })
hi("MiniHipatternsHack", { fg = c.bg0, bg = c.yellow, bold = true })
hi("MiniHipatternsNote", { fg = c.bg0, bg = c.cyan, bold = true })
hi("MiniHipatternsTodo", { fg = c.bg0, bg = c.purple, bold = true })

hi("MiniIconsAzure", { fg = c.blue })
hi("MiniIconsBlue", { fg = c.blue })
hi("MiniIconsCyan", { fg = c.cyan })
hi("MiniIconsGreen", { fg = c.green })
hi("MiniIconsGrey", { fg = c.fg })
hi("MiniIconsOrange", { fg = c.orange })
hi("MiniIconsPurple", { fg = c.purple })
hi("MiniIconsRed", { fg = c.red })
hi("MiniIconsYellow", { fg = c.yellow })

hi("MiniIndentscopeSymbol", { fg = c.grey })
hi("MiniIndentscopePrefix", { nocombine = true })

hi("MiniJump", { fg = c.purple, underline = true, sp = c.purple })

hi("MiniJump2dDim", { fg = c.grey, nocombine = true })
hi("MiniJump2dSpot", { fg = c.red, bold = true, nocombine = true })
hi("MiniJump2dSpotAhead", { fg = c.cyan, bg = c.bg0, nocombine = true })
hi("MiniJump2dSpotUnique", { fg = c.yellow, bold = true, nocombine = true })

hi("MiniMapNormal", { link = "NormalFloat" })
hi("MiniMapSymbolCount", { link = "Special" })
hi("MiniMapSymbolLine", { link = "Title" })
hi("MiniMapSymbolView", { link = "Delimiter" })

hi("MiniNotifyBorder", { link = "FloatBorder" })
hi("MiniNotifyNormal", { link = "NormalFloat" })
hi("MiniNotifyTitle", { fg = c.cyan })

hi("MiniOperatorsExchangeFrom", { link = "IncSearch" })

hi("MiniPickBorder", { link = "FloatBorder" })
hi("MiniPickBorderBusy", { link = "DiagnosticWarn" })
hi("MiniPickBorderText", { fg = c.cyan, bold = true })
hi("MiniPickIconDirectory", { link = "Directory" })
hi("MiniPickIconFile", { link = "NormalFloat" })
hi("MiniPickHeader", { link = "DiagnosticHint" })
hi("MiniPickMatchCurrent", { bg = c.bg1 })
hi("MiniPickMatchMarked", { bg = c.bg1 })
hi("MiniPickMatchRanges", { link = "DiagnosticHint" })
hi("MiniPickNormal", { link = "NormalFloat" })
hi("MiniPickPreviewLine", { bg = c.bg1 })
hi("MiniPickPreviewRegion", { link = "IncSearch" })
hi("MiniPickPrompt", { link = "DiagnosticInfo" })

hi("MiniStarterCurrent", { nocombine = true })
hi("MiniStarterFooter", { fg = c.dark_red, italic = true })
hi("MiniStarterHeader", { fg = c.yellow })
hi("MiniStarterInactive", { fg = c.grey, italic = true })
hi("MiniStarterItem", { fg = c.fg, bg = bg })
hi("MiniStarterItemBullet", { fg = c.grey })
hi("MiniStarterItemPrefix", { fg = c.yellow })
hi("MiniStarterSection", { fg = c.white })
hi("MiniStarterQuery", { fg = c.cyan })

hi("MiniStatuslineDevinfo", { fg = c.fg, bg = c.bg1 })
hi("MiniStatuslineFileinfo", { fg = c.fg, bg = c.bg1 })
hi("MiniStatuslineFilename", { fg = c.grey, bg = c.bg_hl })
hi("MiniStatuslineInactive", { link = "StatusLineNC" })
hi("MiniStatuslineModeCommand", { fg = c.bg0, bg = c.yellow, bold = true })
hi("MiniStatuslineModeInsert", { fg = c.bg0, bg = c.blue, bold = true })
hi("MiniStatuslineModeNormal", { fg = c.bg0, bg = c.green, bold = true })
hi("MiniStatuslineModeOther", { fg = c.bg0, bg = c.cyan, bold = true })
hi("MiniStatuslineModeReplace", { fg = c.bg0, bg = c.red, bold = true })
hi("MiniStatuslineModeVisual", { fg = c.bg0, bg = c.purple, bold = true })

hi("MiniSurround", { fg = c.bg0, bg = c.orange })

hi("MiniTablineCurrent", { bold = true })
hi("MiniTablineFill", { fg = c.grey, bg = c.bg_hl })
hi("MiniTablineHidden", { fg = c.fg, bg = c.bg_hl })
hi("MiniTablineModifiedCurrent", { fg = c.orange, bold = true, italic = true })
hi("MiniTablineModifiedHidden", { fg = c.white, bg = c.bg_hl, italic = true })
hi("MiniTablineModifiedVisible", { fg = c.yellow, bg = c.bg0, italic = true })
hi("MiniTablineTabpagesection", { fg = c.bg0, bg = c.yellow })
hi("MiniTablineVisible", { fg = c.white, bg = c.bg0 })

hi("MiniTestEmphasis", { bold = true })
hi("MiniTestFail", { fg = c.red, bold = true })
hi("MiniTestPass", { fg = c.green, bold = true })

hi("MiniTrailspace", { bg = c.red })

-- ============================================================
-- Plugin: Indent Blankline
-- ============================================================
hi("IblIndent", { fg = c.bg_hl, nocombine = true })
hi("IblWhitespace", { fg = c.bg_hl, nocombine = true })
hi("IblScope", { fg = c.purple, nocombine = true })

hi("RainbowDelimiterRed", { fg = c.red })
hi("RainbowDelimiterYellow", { fg = c.yellow })
hi("RainbowDelimiterBlue", { fg = c.blue })
hi("RainbowDelimiterOrange", { fg = c.orange })
hi("RainbowDelimiterGreen", { fg = c.green })
hi("RainbowDelimiterViolet", { fg = c.purple })
hi("RainbowDelimiterCyan", { fg = c.cyan })

-- ============================================================
-- Language: C / C++
-- ============================================================
hi("cInclude", { fg = c.blue })
hi("cStorageClass", { fg = c.purple })
hi("cTypedef", { fg = c.purple })
hi("cDefine", { fg = c.cyan })
hi("cppStatement", { fg = c.purple, bold = true })

-- ============================================================
-- Language: Markdown
-- ============================================================
hi("markdownBlockquote", { fg = c.grey })
hi("markdownBold", { bold = true })
hi("markdownBoldDelimiter", { fg = c.grey })
hi("markdownCode", { fg = c.green })
hi("markdownCodeBlock", { fg = c.green })
hi("markdownCodeDelimiter", { fg = c.yellow })
hi("markdownH1", { fg = c.red, bold = true })
hi("markdownH2", { fg = c.purple, bold = true })
hi("markdownH3", { fg = c.orange, bold = true })
hi("markdownH4", { fg = c.red, bold = true })
hi("markdownH5", { fg = c.purple, bold = true })
hi("markdownH6", { fg = c.orange, bold = true })
hi("markdownHeadingDelimiter", { fg = c.grey })
hi("markdownHeadingRule", { fg = c.grey })
hi("markdownId", { fg = c.yellow })
hi("markdownIdDeclaration", { fg = c.red })
hi("markdownItalic", { italic = true })
hi("markdownItalicDelimiter", { fg = c.grey, italic = true })
hi("markdownLinkDelimiter", { fg = c.grey })
hi("markdownLinkText", { fg = c.red })
hi("markdownLinkTextDelimiter", { fg = c.grey })
hi("markdownListMarker", { fg = c.red })
hi("markdownOrderedListMarker", { fg = c.red })
hi("markdownRule", { fg = c.purple })
hi("markdownUrl", { fg = c.blue, underline = true })
hi("markdownUrlDelimiter", { fg = c.grey })
hi("markdownUrlTitleDelimiter", { fg = c.green })

-- ============================================================
-- Terminal Colors
-- ============================================================
vim.g.terminal_color_0 = c.black
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.purple
vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_7 = c.white
vim.g.terminal_color_8 = c.bright_black
vim.g.terminal_color_9 = c.bright_red
vim.g.terminal_color_10 = c.bright_green
vim.g.terminal_color_11 = c.bright_yellow
vim.g.terminal_color_12 = c.bright_blue
vim.g.terminal_color_13 = c.bright_magenta
vim.g.terminal_color_14 = c.bright_cyan
vim.g.terminal_color_15 = c.bright_white
