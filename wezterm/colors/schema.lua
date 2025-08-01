local oneDark = require("colors.oneDark")

local colorscheme = {
   foreground    = oneDark.lightWhite,
   background    = oneDark.background,

   cursor_bg     = oneDark.malibu,
   cursor_border = oneDark.malibu,
   cursor_fg     = oneDark.background,

   selection_bg  = oneDark.lightDark,
   selection_fg  = oneDark.white,

   visual_bell = oneDark.error,
   scrollbar_thumb = oneDark.dark,
   split = oneDark.malibu,
   compose_cursor = oneDark.coral,

   indexed = {},
   ansi = {
      oneDark.background,
      oneDark.coral,
      oneDark.green,
      oneDark.chalky,
      oneDark.malibu,
      oneDark.purple,
      oneDark.fountainBlue,
      oneDark.lightWhite
   },
   brights = {
      oneDark.lightDark,
      oneDark.coral,
      oneDark.green,
      oneDark.chalky,
      oneDark.malibu,
      oneDark.purple,
      oneDark.fountainBlue,
      oneDark.white
   },
   tab_bar = {
      background = oneDark.background,
      active_tab = { bg_color = oneDark.background, fg_color = oneDark.malibu, italic = true },
      inactive_tab = { bg_color = oneDark.background, fg_color = oneDark.lightDark },
      inactive_tab_hover = { bg_color = oneDark.background, fg_color = oneDark.lightWhite },
      new_tab = { bg_color = oneDark.background, fg_color = oneDark.lightDark },
      new_tab_hover = { bg_color = oneDark.background, fg_color = oneDark.lightWhite, italic = true },
   },
}

return colorscheme
