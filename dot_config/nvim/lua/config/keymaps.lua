-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- quicker to vim cmd line
vim.keymap.set({'n', 'v'}, ';', ':')
-- alt <esc>
vim.keymap.set('i', 'jj', '<esc>')
-- clear highlighting
vim.keymap.set('n', '<leader><space>', ':noh<cr>', { silent = true})