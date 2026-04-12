local c = require("onedark.palette")

return {
  "ntpeters/vim-better-whitespace",
  event = "VeryLazy",
  config = function()
    vim.g.better_whitespace_enabled = 1
    vim.g.strip_only_modified_lines = 1
    vim.g.better_whitespace_guicolor = c.red
  end,
}
