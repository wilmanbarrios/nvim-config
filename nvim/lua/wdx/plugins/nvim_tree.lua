--- Automatically runs `./install` when a new file/directory is
--- Added/Rename/Deleted
local register_listeners = function()
  local api = require("nvim-tree.api")
  local Event = api.events.Event

  local update_symlinks = function()
    local has_dodbot = vim.fn.getcwd():match("nvim%-config")

    if not has_dodbot then
      return
    end

    vim.schedule(function()
      vim.fn.system({ "./install", "-Q" })
      vim.notify("symlinks installed!")
    end)
  end

  api.events.subscribe(Event.NodeRenamed, update_symlinks)
  api.events.subscribe(Event.FolderCreated, update_symlinks)
  api.events.subscribe(Event.FolderRemoved, update_symlinks)
  api.events.subscribe(Event.FileCreated, update_symlinks)
  api.events.subscribe(Event.FileRemoved, update_symlinks)
end

return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
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
      },
    },
    config = function(_, opts)
      require("nvim-tree").setup(vim.tbl_extend("force", {
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")

          local function opts(desc)
            return {
              desc = "nvim-tree: " .. desc,
              buffer = bufnr,
              noremap = true,
              silent = true,
              nowait = true,
            }
          end

          api.config.mappings.default_on_attach(bufnr)

          vim.keymap.set(
            "n",
            "h",
            api.node.navigate.parent_close,
            opts("Close node")
          )
          vim.keymap.set("n", "l", api.node.open.edit, opts("Open node"))
        end,
      }, opts))

      register_listeners()
    end,
    keys = function()
      local api = require("nvim-tree.api")

      return {
        {
          "<C-b>",
          function()
            api.tree.toggle()
          end,
          desc = "Open/close nvim-tree",
        },
        {
          "<Leader>l",
          function()
            api.tree.find_file({ open = true, focus = true })
          end,
          desc = "Open the current buffer on the tree, or focusing it if already open.",
        },
      }
    end,
  },
}
