return {
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     local prettier = nls.builtins.formatting.prettier.with({
  --       filetypes = { "json", "jsonc", "yaml", "markdown", "javascript" },
  --     })
  --     opts.sources = vim.list_extend(opts.sources or {}, prettier)
  --   end,
  -- },
}
