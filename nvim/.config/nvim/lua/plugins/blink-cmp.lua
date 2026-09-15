return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      per_filetype = {
        text = {},
        markdown = {},
      },
    },
    keymap = {
      preset = "super-tab",
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
    },
    cmdline = {
      keymap = {
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
      },
    },
  },
}
