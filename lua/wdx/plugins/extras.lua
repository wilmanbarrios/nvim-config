return {
  -- Improved window navigation between tmux panes and vim
  { "christoomey/vim-tmux-navigator", event = "VeryLazy" },

  -- Improved vim startuptime profiler
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- To delete only the spaces I add to a file and not the existing ones
  {
    "lewis6991/spaceless.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "mattn/emmet-vim",
    ft = { "html", "css", "scss", "less", "javascriptreact", "typescriptreact", "vue", "svelte", "astro", "eruby", "htmldjango" },
  },

  -- Commenting
  {
    "echasnovski/mini.comment",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },

  -- Minimal and fast autopairs
  {
    "echasnovski/mini.pairs",
    version = "*",
    event = "InsertEnter",
    config = true,
  },

  -- Surround things with things
  {
    "tpope/vim-surround",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Pairs of handy bracket mappings
  {
    "tpope/vim-unimpaired",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Expand builtin text-objects
  {
    "wellle/targets.vim",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Align stuffs
  {
    "junegunn/vim-easy-align",
    cmd = "EasyAlign",
  },

  -- Find and replace UI
  {
    "MagicDuck/grug-far.nvim",
    main = "grug-far",
    opts = {},
    keys = {
      {
        "<leader>sr",
        require("grug-far").open,
        desc = "Open grug-far",
      },
      {
        mode = "v",
        "<leader>sr",
        function()
          require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
        end,
        desc = "Search current word",
      },
    },
  },

  -- Notifications
  {
    "j-hui/fidget.nvim",
    main = "fidget",
    config = true,
    event = "VeryLazy",
    opts = function()
      return {
        -- - Add 'NvimTree' to the 'notification.window.avoid' list to ensure Fidget continues to avoid nvim-tree.lua's file explorer.
        notification = {
          window = {
            avoid = { "NvimTree" },
          },
          override_vim_notify = true,
          configs = {
            default = vim.tbl_extend(
              "force",
              require("fidget.notification").default_config,
              {
                name = false,
                icon = false,
              }
            ),
          },
        },
      }
    end,
  },

  -- highlight hex color
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    main = "colorizer",
    config = true,
  },

  {
    "johmsalas/text-case.nvim",
    main = "textcase",
    keys = {
      {
        mode = { "n", "v" },
        "<leader>ctc",
        "<cmd>lua require('textcase').operator('to_camel_case')<CR>",
        desc = "[c]ase [t]o [c]amelCase",
      },
      {
        mode = { "n", "v" },
        "<leader>ctd",
        "<cmd>lua require('textcase').operator('to_dash_case')<CR>",
        desc = "[c]ase [t]o [d]ash_case",
      },
      {
        mode = { "n", "x" },
        "<leader>ctt",
        "<cmd>lua require('textcase').operator('to_title_case')<CR>",
        desc = "[c]ase [t]o [t]itle",
      },
      {
        mode = { "n", "x" },
        "<leader>cts",
        "<cmd>lua require('textcase').operator('to_snake_case')<CR>",
        desc = "[c]ase [t]o [s]nake",
      },
    },
  },

  {
    "kevinhwang91/nvim-ufo",
    main = "ufo",
    dependencies = "kevinhwang91/promise-async",
    init = function()
      vim.o.foldenable = true
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.fillchars =
        "eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:"
    end,
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },
  },
}
