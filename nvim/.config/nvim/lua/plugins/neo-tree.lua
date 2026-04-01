return {
    "nvim-neo-tree/neo-tree.nvim",
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
        close_if_last_window = true,
        window = {
            position = "right",
        },
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
    },
    init = function()
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                if vim.fn.argc() == 0 then
                    require("neo-tree.command").execute({ action = "show", dir = vim.loop.cwd() })
                end
            end,
        })
    end,
}
