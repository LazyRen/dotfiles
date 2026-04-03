return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-cmdline",
    "dmitmel/cmp-cmdline-history",
  },
  opts = function(_, opts)
    local cmp = require("cmp")

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.snippet.active({ direction = 1 }) then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.snippet.active({ direction = -1 }) then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
        else
          fallback()
        end
      end, { "i", "s" }),
    })

    local cmdline_mapping = cmp.mapping.preset.cmdline({
      ["<C-j>"] = {
        c = function(fallback)
          if cmp.visible() then cmp.select_next_item() else fallback() end
        end,
      },
      ["<C-k>"] = {
        c = function(fallback)
          if cmp.visible() then cmp.select_prev_item() else fallback() end
        end,
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmdline_mapping,
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } },
        { name = "cmdline_history" },
      }),
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmdline_mapping,
      sources = {
        { name = "buffer" },
        { name = "cmdline_history" },
      },
    })
  end,
}
