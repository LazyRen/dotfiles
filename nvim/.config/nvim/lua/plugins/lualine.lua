return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.component_separators = { left = "╲", right = "╱" }
      opts.options.section_separators = { left = "", right = "" }
      opts.options.disabled_filetypes.winbar = opts.options.disabled_filetypes.statusline

      opts.sections.lualine_a = { "mode" }
      opts.sections.lualine_b = { LazyVim.lualine.root_dir() }
      opts.sections.lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { LazyVim.lualine.pretty_path({ length = 8 }) },
      }
      opts.sections.lualine_z = { "branch" }

      table.insert(opts.sections.lualine_x, {
        function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          if #clients == 0 then return "" end
          local names = {}
          for _, c in ipairs(clients) do
            table.insert(names, c.name)
          end
          return table.concat(names, ", ")
        end,
        icon = " ",
        color = { fg = require("onedark.palette").cyan },
      })

      opts.winbar = {
        lualine_b = { "filename" },
        lualine_c = { { "navic", color_correction = "dynamic" } },
      }
      opts.inactive_winbar = { lualine_b = { "filename" } }
    end,
  },
}
