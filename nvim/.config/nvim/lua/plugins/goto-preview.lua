return {
  "rmagatti/goto-preview",
  dependencies = { "rmagatti/logger.nvim" },
  init = function()
    require("goto-preview").setup({
      width = 160,
      height = 40,
      default_mappings = false,
      references = {
        provider = "snacks",
      },
      dismiss_on_move = true,
      stack_floating_preview_windows = false,
      post_open_hook = function(buf)
        vim.keymap.set("n", "<Esc>", "<cmd>q<CR>", { buffer = buf, silent = true })
        vim.keymap.set("n", "q", "<cmd>q<CR>", { buffer = buf, silent = true })
        vim.keymap.set("n", "go", function()
          local cursor = vim.api.nvim_win_get_cursor(0)
          require("goto-preview").close_all_win()
          if vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_set_current_buf(buf)
            local line_count = vim.api.nvim_buf_line_count(buf)
            if cursor[1] > 0 and cursor[1] <= line_count then
              vim.api.nvim_win_set_cursor(0, cursor)
            end
          end
        end, { buffer = buf, silent = true })
      end,
    })
  end,
  keys = {
    { "gpd", function() require("goto-preview").goto_preview_definition() end, desc = "Preview Definition" },
    { "gpt", function() require("goto-preview").goto_preview_type_definition() end, desc = "Preview Type Definition" },
    { "gpi", function() require("goto-preview").goto_preview_implementation() end, desc = "Preview Implementation" },
    { "gpD", function() require("goto-preview").goto_preview_declaration() end, desc = "Preview Declaration" },
    { "gpr", function() require("goto-preview").goto_preview_references() end, desc = "Preview References" },
    { "gP", function() require("goto-preview").close_all_win() end, desc = "Close All Preview Windows" },
  },
}
