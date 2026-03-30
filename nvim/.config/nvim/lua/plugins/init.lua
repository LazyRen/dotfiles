return {
    {
        "stevearc/conform.nvim",
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- Completion: blink.cmp
    { import = "nvchad.blink.lazyspec" },

    -- Inline diagnostics
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "LspAttach",
        opts = { preset = "modern" },
    },

    -- Code folding
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        event = "BufRead",
        opts = {},
        init = function()
            vim.o.foldcolumn = "1"
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
        end,
    },
}
