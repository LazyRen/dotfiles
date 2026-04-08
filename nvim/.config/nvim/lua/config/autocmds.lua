-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

require("config.usercmds")

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local snacks_windows = {}
    local floating_windows = {}
    local windows = vim.api.nvim_list_wins()
    for _, w in ipairs(windows) do
      local filetype = vim.api.nvim_get_option_value("filetype", { buf = vim.api.nvim_win_get_buf(w) })
      if filetype:match("snacks_") ~= nil then
        table.insert(snacks_windows, w)
      elseif vim.api.nvim_win_get_config(w).relative ~= "" then
        table.insert(floating_windows, w)
      end
    end
    if #windows - #floating_windows - #snacks_windows <= 1 then
      vim.cmd("qa")
    end
  end,
})

local user_grp = vim.api.nvim_create_augroup("LazyUserGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lazy",
  desc = "Quit lazy with <esc>",
  callback = function()
    vim.keymap.set(
      "n",
      "<esc>",
      function() vim.api.nvim_win_close(0, false) end,
      { buffer = true, nowait = true }
    )
  end,
  group = user_grp,
})
