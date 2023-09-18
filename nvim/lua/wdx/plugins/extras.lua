return {
  { "christoomey/vim-tmux-navigator", event = "VeryLazy" }, -- Improved window navigation between tmux panes and vim
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  }, -- Improved vim startuptime profiler
  {
    "lewis6991/spaceless.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "mattn/emmet-vim",
    event = { "BufReadPre", "BufNewFile" },
  }, -- Emmet
  {
    "tpope/vim-commentary",
    event = { "BufReadPre", "BufNewFile" },
  }, -- Commenting
  {
    "tpope/vim-surround",
    event = { "BufReadPre", "BufNewFile" },
  }, -- sorround things with things
  {
    "tpope/vim-unimpaired",
    event = { "BufReadPre", "BufNewFile" },
  }, -- extra set of mapping
  {
    "wellle/targets.vim",
    event = { "BufReadPre", "BufNewFile" },
  }, -- Expand builtin text-objects
  {
    "windwp/nvim-autopairs",
    config = true,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "junegunn/vim-easy-align",
    cmd = "EasyAlign",
  }, -- align stuffs
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
    event = { "BufReadPre", "BufNewFile" },
    tag = "legacy",
    -- -- I have a set of customizations to properly ignore code_actions so I don't
    -- -- want to override my changes for now.
    -- pin = true,
    -- opts = {
    --   sources = {
    --     ['null-ls'] = {
    --       ignore = { 'code_action', 'diagnostics' }
    --     }
    --   }
    -- },
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
        "<cmd>lua require('textcase').current_word('to_camel_case')<CR>",
        desc = "[c]ase [t]o [c]amelCase",
      },
    },
  },

  {
    "ray-x/lsp_signature.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
}
