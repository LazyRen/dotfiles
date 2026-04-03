-- lazy.nvim
return {
  "folke/snacks.nvim",
  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 0 then
          vim.schedule(function()
            Snacks.explorer.open()
          end)
        end
      end,
    })
  end,
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
