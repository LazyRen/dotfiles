local M = {}

function M.load()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "onedark"

  local c = require("onedark.palette")
  local bg = c.none -- transparent

  -- Collect all highlight groups
  local highlights = {}
  local function merge(groups)
    for k, v in pairs(groups) do
      highlights[k] = v
    end
  end

  -- Core groups
  merge(require("onedark.groups.editor").get(c, bg))
  merge(require("onedark.groups.syntax").get(c, bg))
  merge(require("onedark.groups.treesitter").get(c, bg))
  merge(require("onedark.groups.semantic_tokens").get(c, bg))
  merge(require("onedark.groups.diagnostics").get(c, bg))

  -- Plugin integrations
  local integrations = {
    "blink_cmp", "bufferline", "codediff", "gitsigns",
    "snacks", "whichkey", "mini", "indent_blankline",
  }
  for _, name in ipairs(integrations) do
    merge(require("onedark.groups.integrations." .. name).get(c, bg))
  end

  -- Apply all highlights
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Terminal colors
  require("onedark.groups.terminal").set(c)

  -- Post-load hooks (e.g. BufferLine icon patching)
  require("onedark.groups.integrations.bufferline").setup(c)
end

return M
