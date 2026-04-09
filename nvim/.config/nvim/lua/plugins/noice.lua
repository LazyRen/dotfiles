return {
  "folke/noice.nvim",
  opts = {
    presets = {
      bottom_search = false,
    },
    views = {
      cmdline_popup = {
        position = {
          row = "50%",
          col = "50%",
        },
      },
      confirm = {
        position = {
          row = "50%",
          col = "50%",
        },
      },
    },
    routes = {
      {
        filter = { event = "lsp", kind = "progress", find = "pyright" },
        opts = { skip = true },
      },
    },
  },
}
