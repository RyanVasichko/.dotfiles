return {
  { import = "lazyvim.plugins.extras.lang.ruby" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  -- Formatting doesn't really work right. Commenting out for now, maybe they'll fix it later
  -- {
  --   "nvimtools/none-ls.nvim",
  --
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     opts.root_dir = opts.root_dir
  --       or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
  --     opts.sources = vim.list_extend(opts.sources or {}, {
  --       nls.builtins.formatting.erb_lint,
  --       nls.builtins.diagnostics.erb_lint,
  --     })
  --     opts.debug = true
  --   end,
  -- },
}
