return {
  { "rebelot/kanagawa.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = true,
  --   priority = 1000, -- Ensure it loads before other plugins
  --   opts = {
  --     flavour = "mocha", -- Set the flavour you want (mocha, latte, frappe, macchiato)
  --   },
  --   config = function(_, opts)
  --     require("catppuccin").setup(opts)
  --     vim.cmd([[colorscheme catppuccin]])
  --   end,
  -- },
}
