local M = {}

function M.get(c, _)
  return {
    BufferLineBuffer = { fg = c.grey, bg = c.bg_d },
    BufferLineBufferVisible = { fg = c.grey, bg = c.bg_d },
    BufferLineBufferSelected = { fg = c.fg, bold = true },
    BufferLineCloseButton = { fg = c.grey, bg = c.bg_d },
    BufferLineCloseButtonVisible = { fg = c.grey, bg = c.bg_d },
    BufferLineCloseButtonSelected = { fg = c.red },
    BufferLineDuplicate = { fg = c.grey, bg = c.bg_d, italic = true },
    BufferLineDuplicateVisible = { fg = c.grey, bg = c.bg_d, italic = true },
    BufferLineDuplicateSelected = { fg = c.fg, italic = true },
    BufferLineModified = { fg = c.grey, bg = c.bg_d },
    BufferLineModifiedVisible = { fg = c.grey, bg = c.bg_d },
    BufferLineModifiedSelected = { fg = c.green },
    BufferLineSeparator = { fg = c.border, bg = c.bg_d },
    BufferLineSeparatorVisible = { fg = c.border, bg = c.bg_d },
    BufferLineSeparatorSelected = { fg = c.border },
    BufferLineIndicatorSelected = { fg = c.blue },
    BufferLineFill = { bg = c.bg_d },
    BufferLineTab = { fg = c.grey, bg = c.bg_d },
    BufferLineTabSelected = { fg = c.fg, bold = true },
    BufferLineTabClose = { fg = c.red, bg = c.bg_d },
    BufferLineDiagnostic = { fg = c.grey, bg = c.bg_d },
    BufferLineDiagnosticVisible = { fg = c.grey, bg = c.bg_d },
    BufferLineError = { fg = c.grey, bg = c.bg_d },
    BufferLineErrorVisible = { fg = c.grey, bg = c.bg_d },
    BufferLineErrorSelected = { fg = c.red },
    BufferLineErrorDiagnostic = { fg = c.grey, bg = c.bg_d },
    BufferLineErrorDiagnosticVisible = { fg = c.grey, bg = c.bg_d },
    BufferLineErrorDiagnosticSelected = { fg = c.red },
    BufferLineWarning = { fg = c.grey, bg = c.bg_d },
    BufferLineWarningVisible = { fg = c.grey, bg = c.bg_d },
    BufferLineWarningSelected = { fg = c.yellow },
    BufferLineWarningDiagnostic = { fg = c.grey, bg = c.bg_d },
    BufferLineWarningDiagnosticVisible = { fg = c.grey, bg = c.bg_d },
    BufferLineWarningDiagnosticSelected = { fg = c.yellow },
    BufferLineInfo = { fg = c.grey, bg = c.bg_d },
    BufferLineInfoVisible = { fg = c.grey, bg = c.bg_d },
    BufferLineInfoSelected = { fg = c.blue },
    BufferLineInfoDiagnostic = { fg = c.grey, bg = c.bg_d },
    BufferLineInfoDiagnosticVisible = { fg = c.grey, bg = c.bg_d },
    BufferLineInfoDiagnosticSelected = { fg = c.blue },
    BufferLineHint = { fg = c.grey, bg = c.bg_d },
    BufferLineHintVisible = { fg = c.grey, bg = c.bg_d },
    BufferLineHintSelected = { fg = c.cyan },
    BufferLineHintDiagnostic = { fg = c.grey, bg = c.bg_d },
    BufferLineHintDiagnosticVisible = { fg = c.grey, bg = c.bg_d },
    BufferLineHintDiagnosticSelected = { fg = c.cyan },
  }
end

--- Patch BufferLine icon highlights to gray out inactive buffer icons
function M.setup(c)
  vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
      local ok, bl_hl = pcall(require, "bufferline.highlights")
      if not ok then return end
      local orig = bl_hl.set_icon_highlight
      bl_hl.set_icon_highlight = function(state, hls, base_hl)
        local hl_name = orig(state, hls, base_hl)
        -- SELECTED = 3, INACTIVE = 2, NONE = 1
        if state ~= 3 then
          vim.api.nvim_set_hl(0, hl_name, { fg = c.grey, bg = c.bg_d })
        end
        return hl_name
      end
    end,
  })
end

return M
