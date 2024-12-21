return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  {
    "catppuccin",
    enabled = false,
  },
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    init = function()
      vim.g.material_style = "oceanic"
    end,
    -- config = function()
    --   vim.cmd([[colorscheme material]])
    -- end,
    opts = {
      high_visibility = {
        darker = true,
      },
      plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        -- "dashboard",
        "gitsigns",
        -- "hop",
        "indent-blankline",
        -- "lspsaga",
        -- "mini",
        "neogit",
        "nvim-cmp",
        -- "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
        -- "sneak",
        "telescope",
        "trouble",
        "which-key",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material",
    },
  },
}
