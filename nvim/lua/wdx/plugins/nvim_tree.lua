return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
  opts = {
    filters = {
      custom = {".git", "dotbot"},
      exclude = {".env"}
    },
    view = {
      width = 41,
      side = "right",
      mappings = {
        custom_only = false,
        list = {
          { key = "h", action = "close_node" },
          { key = "l", action = "edit" },
        }
      }
    },
  },
  keys = function()
    local api = require'nvim-tree.api'

    --- open the current buffer on the tree, or focusing it if already open.
    local find_file = function()
      api.tree.open({ find_file = true })
    end

    return {
      {"<C-b>", api.tree.toggle, desc = 'Open/close nvim-tree'},
      {"<Leader>l", find_file, desc = 'Open the current buffer on the tree, or focusing it if already open.'},
    }
  end
}
