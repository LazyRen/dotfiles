return {
  "folke/edgy.nvim",
  opts = {
    right = {
      {
        ft = "",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        size = { height = 0.5 },
      },
    },
    left = {},
  },
}
