local api = require'nvim-tree.api'

require'nvim-tree'.setup {
  filters = {
    dotfiles = false, -- show me all the . files
    custom = { "^.git$" }, -- propertly exclude .git directory
  },
  git = {
    ignore = false, -- show me all files ignored by git
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
}

local map_options = {silent = true, noremap = true}

--- open the current buffer on the tree, or focusing it if already open.
local find_file = function()
  api.tree.open({ find_file = true })
end

vim.keymap.set("n", "<C-b>", api.tree.toggle, map_options)
vim.keymap.set("n", "<Leader>l", find_file, map_options)
