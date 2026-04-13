return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.component_separators = ""
      opts.options.section_separators = { left = "", right = "" }
      opts.options.disabled_filetypes.winbar = opts.options.disabled_filetypes.statusline

      opts.sections.lualine_c[4] = { LazyVim.lualine.pretty_path({ length = 8 }) }

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

      opts.sections.lualine_z = {
        function()
          return os.date("%R")
        end
      }

      -- move navic from statusline to winbar
      local navic = table.remove(opts.sections.lualine_c)
      opts.winbar = { lualine_b = { "filename" }, lualine_c = { navic } }
      opts.inactive_winbar = { lualine_b = { "filename" } }
    end,
  },
}
