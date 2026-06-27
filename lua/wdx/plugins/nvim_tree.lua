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

          api.map.on_attach.default(bufnr)

          vim.keymap.set(
            "n",
            "h",
            api.node.navigate.parent_close,
            opts("Close node")
          )
          vim.keymap.set("n", "l", api.node.open.edit, opts("Open node"))
        end,
      }, opts))
    end,
    keys = function()
      return {
        {
          "<C-b>",
          function()
            require("nvim-tree.api").tree.toggle()
          end,
          desc = "Open/close nvim-tree",
        },
        {
          "<Leader>l",
          function()
            require("nvim-tree.api").tree.find_file({
              open = true,
              focus = true,
            })
          end,
          desc = "Open the current buffer on the tree, or focusing it if already open.",
        },
      }
    end,
  },
}
