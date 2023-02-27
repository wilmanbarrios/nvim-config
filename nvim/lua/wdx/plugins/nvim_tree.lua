return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      filters = {
        custom = { "^.git$" }, -- propertly exclude .git directory
        dotfiles = false, -- show me all the . files
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
    },
    keys = {
      {"<C-b>", '<cmd>NvimTreeToggle<cr>', desc = 'Open/close nvim-tree'},
      {
        "<Leader>l",
        function()
          require'nvim-tree.api'.tree.open({ find_file = true })
        end,
        desc = 'Open the current buffer on the tree, or focusing it if already open.'
      },
    }
  },
}
