return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    -- window = {
    --   position = "current",
    -- },
    filesystem = {
      -- hijack_netrw_behavior = "open_current",
      filtered_items = {
        visible = true, -- Show hidden files by default
        hide_dotfiles = false, -- Do not hide other dotfiles
        hide_gitignored = false, -- Optionally, do not hide git-ignored files
        never_show = { ".git", ".idea", ".ruby-lsp" }, -- Always hide the .git directory
      },
    },
    -- event_handlers = {
    --   {
    --     event = "file_open_requested",
    --     handler = function()
    --       require("neo-tree.command").execute({ action = "close" })
    --     end,
    --   },
    -- },
    window = {
      mappings = {
        ["e"] = function()
          vim.cmd("Neotree focus filesystem left", true)
        end,
        ["b"] = function()
          vim.cmd("Neotree focus buffers left", true)
        end,
        ["g"] = function()
          vim.cmd("Neotree focus git_status left", true)
        end,
      },
    },
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
    },
  },
  keys = {
    {
      "<leader>cy",
      function()
        vim.cmd("Neotree document_symbols")
      end,
      desc = "Open document symbols in Neotree",
    },
  },
}
