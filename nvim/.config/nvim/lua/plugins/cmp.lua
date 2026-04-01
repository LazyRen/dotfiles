return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-cmdline",
    "dmitmel/cmp-cmdline-history",
  },
  opts = function(_, opts)
    local cmp = require("cmp")

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
