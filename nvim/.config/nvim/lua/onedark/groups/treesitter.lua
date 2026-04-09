local M = {}

function M.get(c, _)
  return {
    -- Attributes
    ["@attribute"] = { fg = c.cyan },
    ["@attribute.builtin"] = { fg = c.blue },

    -- Primitives
    ["@boolean"] = { fg = c.orange },
    ["@character"] = { fg = c.orange },
    ["@character.special"] = { fg = c.red },
    ["@number"] = { fg = c.orange },
    ["@number.float"] = { fg = c.orange },

    -- Comments
    ["@comment"] = { fg = c.grey, italic = true },
    ["@comment.documentation"] = { fg = c.grey, italic = true },
    ["@comment.error"] = { fg = c.red, italic = true },
    ["@comment.note"] = { fg = c.blue, italic = true },
    ["@comment.todo"] = { fg = c.purple, italic = true },
    ["@comment.warning"] = { fg = c.yellow, italic = true },

    -- Constants
    ["@constant"] = { fg = c.orange },
    ["@constant.builtin"] = { fg = c.orange },
    ["@constant.macro"] = { fg = c.orange },

    -- Constructors
    ["@constructor"] = { fg = c.yellow, bold = true },

    -- Diffs
    ["@diff.plus"] = { fg = c.green },
    ["@diff.minus"] = { fg = c.red },
    ["@diff.delta"] = { fg = c.blue },

    -- Functions
    ["@function"] = { fg = c.blue },
    ["@function.builtin"] = { fg = c.cyan },
    ["@function.call"] = { fg = c.blue },
    ["@function.macro"] = { fg = c.cyan },
    ["@function.method"] = { fg = c.blue },
    ["@function.method.call"] = { fg = c.blue },

    -- Keywords
    ["@keyword"] = { fg = c.purple },
    ["@keyword.conditional"] = { fg = c.purple },
    ["@keyword.conditional.ternary"] = { fg = c.purple },
    ["@keyword.coroutine"] = { fg = c.purple },
    ["@keyword.debug"] = { fg = c.red },
    ["@keyword.directive"] = { fg = c.purple },
    ["@keyword.directive.define"] = { fg = c.purple },
    ["@keyword.exception"] = { fg = c.purple },
    ["@keyword.function"] = { fg = c.purple },
    ["@keyword.import"] = { fg = c.purple },
    ["@keyword.modifier"] = { fg = c.purple },
    ["@keyword.operator"] = { fg = c.purple },
    ["@keyword.repeat"] = { fg = c.purple },
    ["@keyword.return"] = { fg = c.purple },
    ["@keyword.type"] = { fg = c.purple },

    -- Labels
    ["@label"] = { fg = c.red },

    -- Markup
    ["@markup.strong"] = { fg = c.fg, bold = true },
    ["@markup.italic"] = { fg = c.fg, italic = true },
    ["@markup.strikethrough"] = { fg = c.fg, strikethrough = true },
    ["@markup.underline"] = { fg = c.fg, underline = true },
    ["@markup.heading"] = { fg = c.orange, bold = true },
    ["@markup.heading.1"] = { fg = c.red, bold = true },
    ["@markup.heading.2"] = { fg = c.purple, bold = true },
    ["@markup.heading.3"] = { fg = c.orange, bold = true },
    ["@markup.heading.4"] = { fg = c.red, bold = true },
    ["@markup.heading.5"] = { fg = c.purple, bold = true },
    ["@markup.heading.6"] = { fg = c.orange, bold = true },
    ["@markup.link"] = { fg = c.blue },
    ["@markup.link.label"] = { fg = c.cyan },
    ["@markup.link.url"] = { fg = c.cyan, underline = true },
    ["@markup.list"] = { fg = c.red },
    ["@markup.list.checked"] = { fg = c.green, italic = true },
    ["@markup.list.unchecked"] = { fg = c.red, italic = true },
    ["@markup.math"] = { fg = c.fg },
    ["@markup.quote"] = { fg = c.grey, italic = true },
    ["@markup.raw"] = { fg = c.green },
    ["@markup.raw.block"] = { fg = c.green },

    -- Modules
    ["@module"] = { fg = c.yellow },
    ["@module.builtin"] = { fg = c.orange },

    -- Misc
    ["@none"] = { fg = c.fg },
    ["@conceal"] = { fg = c.grey },

    -- Operators
    ["@operator"] = { fg = c.fg },

    -- Properties
    ["@property"] = { fg = c.cyan },

    -- Punctuation
    ["@punctuation.bracket"] = { fg = c.white },
    ["@punctuation.delimiter"] = { fg = c.white },
    ["@punctuation.special"] = { fg = c.red },

    -- Strings
    ["@string"] = { fg = c.green },
    ["@string.documentation"] = { fg = c.green },
    ["@string.escape"] = { fg = c.red },
    ["@string.regexp"] = { fg = c.orange },
    ["@string.special"] = { fg = c.cyan },
    ["@string.special.path"] = { fg = c.green },
    ["@string.special.symbol"] = { fg = c.cyan },
    ["@string.special.url"] = { fg = c.cyan, underline = true },

    -- Tags
    ["@tag"] = { fg = c.purple },
    ["@tag.builtin"] = { fg = c.purple },
    ["@tag.attribute"] = { fg = c.yellow },
    ["@tag.delimiter"] = { fg = c.purple },

    -- Types
    ["@type"] = { fg = c.yellow },
    ["@type.builtin"] = { fg = c.orange },
    ["@type.definition"] = { fg = c.yellow },

    -- Variables
    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.red },
    ["@variable.member"] = { fg = c.cyan },
    ["@variable.parameter"] = { fg = c.red },
    ["@variable.parameter.builtin"] = { fg = c.orange },
  }
end

return M
