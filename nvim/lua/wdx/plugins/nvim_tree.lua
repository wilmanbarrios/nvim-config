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
    config = function(_, opts)
      require('nvim-tree').setup(opts)

      local api = require('nvim-tree.api')
      local Event = api.events.Event

      local update_symlinks = function()
        local has_dodbot = vim.fn.getcwd():match('nvim%-config') 

        if not has_dodbot then
          return
        end

        vim.schedule(function()
          vim.fn.system({ './install', '-Q' })
          vim.notify('symlinks installed!')
        end)
      end

      api.events.subscribe(Event.NodeRenamed, update_symlinks)
      api.events.subscribe(Event.FolderCreated, update_symlinks)
      api.events.subscribe(Event.FolderRemoved, update_symlinks)
      api.events.subscribe(Event.FileCreated, update_symlinks)
      api.events.subscribe(Event.FileRemoved, update_symlinks)
    end,
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
