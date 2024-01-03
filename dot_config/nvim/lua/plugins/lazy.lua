return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material",
    },
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   opts = {
  --     filesystem = {
  --       follow_current_file = { enabled = false},
  --     },
  --   },
  -- },
  {
    "nvim-telescope/telescope.nvim",
     keys = {
        -- disable the keymap to grep files
        {"<leader><space>", false},
     },
  }
}