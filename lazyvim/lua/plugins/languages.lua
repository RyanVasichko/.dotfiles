vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "Gemfile", "Rakefile", "Capfile", "Guardfile", "Podfile", "Vagrantfile" },
  command = "set filetype=ruby",
})

return {
  { import = "lazyvim.plugins.extras.lang.ruby" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  {
    "williamboman/mason.nvim",
    optional = true,
    opts = { ensure_installed = { "rust-analyzer" } },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "javascript", "tsx" },
    },
  },
}
