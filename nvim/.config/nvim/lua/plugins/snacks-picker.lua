local flash_on_picker = function(picker)
  require("flash").jump({
    pattern = "^",
    label = { after = { 0, 0 } },
    search = {
      mode = "search",
      exclude = {
        function(win)
          return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
        end,
      },
    },
    action = function(match)
      local idx = picker.list:row2idx(match.pos[1])
      picker.list:_move(idx, true, true)
    end,
  })
end

return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      actions = {
        flash = flash_on_picker,
      },
      sources = {
        files = {
          hidden = true,
        },
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
      win = {
        input = {
          keys = {
            ["<a-s>"] = { "flash", mode = { "n", "i" } },
            ["s"] = { "flash" },
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>b",
      function()
        Snacks.picker.buffers({
          on_show = function(picker)
            vim.cmd.stopinsert()
            vim.schedule(function()
              flash_on_picker(picker)
            end)
          end,
        })
      end,
      desc = "Buffers",
    },
  },
}
