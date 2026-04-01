return {
  "navarasu/onedark.nvim",
  priority = 1000,
  config = function()
    require('onedark').setup {
      style = 'dark',
      transparent = true,
      lualine = { transparent = true },
    }
    require('onedark').load()
  end
}
