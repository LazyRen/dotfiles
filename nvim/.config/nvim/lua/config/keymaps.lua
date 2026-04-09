-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "<PageUp>", "<C-u>", { silent = true })
vim.keymap.set({ "n", "v" }, "<PageDown>", "<C-d>", { silent = true })

-- Disable yank on delete
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true })

Snacks.toggle.zoom():map("<leader>z")
