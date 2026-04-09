local M = {}

function M.get(c, _)
  local highlights = {
    BlinkCmpLabel = { fg = c.fg },
    BlinkCmpLabelDeprecated = { fg = c.white, strikethrough = true },
    BlinkCmpLabelMatch = { fg = c.cyan },
    BlinkCmpDetail = { fg = c.white },
    BlinkCmpKind = { fg = c.purple },
  }

  local kind_colors = {
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

  for kind, color in pairs(kind_colors) do
    highlights["BlinkCmpKind" .. kind] = { fg = color }
  end

  return highlights
end

return M
