return {
  "mbbill/undotree",
  keys = {
    { "<leader>ut", vim.cmd.UndotreeToggle, desc = "Toggle UndoTree" },
  },
  config = function()
    vim.g.undotree_WindowLayout = 2
  end,
}
