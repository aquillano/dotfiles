return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = [[<leader>z]],
      on_open = function(t) vim.cmd('startinsert') end,
      direction = 'tab',
      start_in_insert = true,
      persist_mode = true,
    }
  },
}