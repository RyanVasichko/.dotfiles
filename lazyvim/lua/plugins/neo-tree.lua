return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "current",
    },
    filesystem = {
      hijack_netrw_behavior = "open_current",
      filtered_items = {
        visible = true, -- Show hidden files by default
        hide_dotfiles = false, -- Do not hide other dotfiles
        hide_gitignored = false, -- Optionally, do not hide git-ignored files
        never_show = { ".git", ".idea", ".ruby-lsp" }, -- Always hide the .git directory
      },
    },
  },
}
