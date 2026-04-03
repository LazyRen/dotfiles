return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    opts = {
      style = "darker",
      transparent = true,
      lualine = { transparent = false },
      highlights = {
        SnacksDashboardHeader = { fg = "#61afef" },
        StatusLine = { bg = "NONE", ctermbg = "NONE" },
        StatusLineNC = { bg = "NONE", ctermbg = "NONE" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
