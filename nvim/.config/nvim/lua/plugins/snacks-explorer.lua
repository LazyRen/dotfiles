-- lazy.nvim
return {
  "folke/snacks.nvim",
  -- Uncomment below to open explorer at nvim startup
  -- init = function()
  --   vim.api.nvim_create_autocmd("VimEnter", {
  --     once = true,
  --     callback = function()
  --       if vim.fn.argc() == 0 and vim.o.columns >= 160 then
  --         Snacks.explorer.open()
  --       end
  --     end,
  --   })
  -- end,

  opts = {
    explorer = {
      replace_netrw = true,
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          layout = {
            auto_hide = { "input" },
            hidden = { "input" },
            layout = { position = "right" },
          },
          enter = false,
          win = {
            input = {
              keys = {
                ["<Esc>"] = { "toggle_input", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
}
