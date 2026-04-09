local M = {}

---@param fg string foreground hex color
---@param bg string background hex color
---@param alpha number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(fg, bg, alpha)
  local function hex_to_rgb(hex)
    return tonumber(hex:sub(2, 3), 16), tonumber(hex:sub(4, 5), 16), tonumber(hex:sub(6, 7), 16)
  end
  local r1, g1, b1 = hex_to_rgb(fg)
  local r2, g2, b2 = hex_to_rgb(bg)
  local r = math.floor(alpha * r1 + (1 - alpha) * r2 + 0.5)
  local g = math.floor(alpha * g1 + (1 - alpha) * g2 + 0.5)
  local b = math.floor(alpha * b1 + (1 - alpha) * b2 + 0.5)
  return string.format("#%02X%02X%02X", r, g, b)
end

function M.darken(hex, amount, bg)
  return M.blend(hex, bg or "#000000", math.abs(amount))
end

function M.lighten(hex, amount, fg)
  return M.blend(hex, fg or "#ffffff", math.abs(amount))
end

return M
