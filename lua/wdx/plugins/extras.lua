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
  {
    "lewis6991/spaceless.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "mattn/emmet-vim",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Commenting
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },

  -- Surround things with things
  {
    "tpope/vim-surround",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Extra set of mapping
  {
    "tpope/vim-unimpaired",
    event = { "BufReadPre", "BufNewFile" },
  },
  -- Expand builtin text-objects
  {
    "wellle/targets.vim",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "windwp/nvim-autopairs",
    config = true,
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Align stuffs
  {
    "junegunn/vim-easy-align",
    cmd = "EasyAlign",
  },

  {
    "nvim-pack/nvim-spectre",
    main = "spectre",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      mappings = {
        ["send_to_qf"] = {},
      },
    },
    keys = {
      {
        "<leader>sr",
        '<cmd>lua require("spectre").open()<CR>',
        desc = "Open Spectre",
      },
      {
        mode = "v",
        "<leader>sr",
        '<esc><cmd>lua require("spectre").open_visual()<CR>',
        desc = "Search current word",
      },
    },
  },

  {
    "j-hui/fidget.nvim",
    main = "fidget",
    config = true,
    event = { "BufReadPre", "BufNewFile" },
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
}
