local c = require("onedark.palette")

local bg = { default = c.bg_d, visible = c.bg0, selected = c.bg_hl }
local fg = { default = c.grey, visible = c.silver, selected = c.fg }

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      show_buffer_close_buttons = false,
      show_close_icon = false,
      separator_style = "thin",
      indicator = { style = "icon", icon = "▎" },
    },
    highlights = {
      fill = { bg = bg.default },
      background = { fg = fg.default, bg = bg.default },
      buffer = { fg = fg.default, bg = bg.default },
      buffer_visible = { fg = fg.visible, bg = bg.visible },
      buffer_selected = { fg = fg.selected, bg = bg.selected, bold = true },
      close_button = { fg = fg.default, bg = bg.default },
      close_button_visible = { fg = fg.visible, bg = bg.visible },
      close_button_selected = { fg = fg.selected, bg = bg.selected },
      modified = { fg = c.green, bg = bg.default },
      modified_visible = { fg = c.green, bg = bg.visible },
      modified_selected = { fg = c.green, bg = bg.selected },
      duplicate = { fg = fg.default, bg = bg.default, italic = true },
      duplicate_visible = { fg = fg.visible, bg = bg.visible, italic = true },
      duplicate_selected = { fg = fg.selected, bg = bg.selected, italic = true },
      separator = { fg = bg.default, bg = bg.default },
      separator_visible = { fg = bg.default, bg = bg.visible },
      separator_selected = { fg = bg.default, bg = bg.selected },
      indicator_visible = { fg = bg.visible, bg = bg.visible },
      indicator_selected = { fg = c.blue, bg = bg.selected },
      diagnostic = { bg = bg.default },
      diagnostic_visible = { bg = bg.visible },
      diagnostic_selected = { bg = bg.selected },
      tab = { fg = fg.default, bg = bg.default },
      tab_selected = { fg = fg.selected, bg = bg.selected, bold = true },
      tab_close = { fg = fg.default, bg = bg.default },
      tab_separator = { fg = bg.default, bg = bg.default },
      tab_separator_selected = { fg = bg.default, bg = bg.selected },
      trunc_marker = { fg = fg.default, bg = bg.default },
    },
  },
}
