vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  command = "setlocal indentkeys-=.",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "Gemfile", "Rakefile", "Capfile", "Guardfile", "Podfile", "Vagrantfile" },
  command = "set filetype=ruby",
})
