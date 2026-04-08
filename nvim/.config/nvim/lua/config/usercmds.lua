local copy_path_formats = {
  rel = "%:.",
  abs = "%:p",
  name = "%:t",
  dir = "%:p:h",
}

vim.api.nvim_create_user_command("CopyPath", function(opts)
  local fmt = copy_path_formats[opts.args]
  if not fmt then
    vim.notify("Usage: CopyPath rel|abs|name|dir", vim.log.levels.ERROR)
    return
  end
  local path = vim.fn.expand(fmt)
  vim.fn.setreg("+", path)
  vim.notify(path)
end, {
  nargs = 1,
  complete = function()
    return vim.tbl_keys(copy_path_formats)
  end,
})
