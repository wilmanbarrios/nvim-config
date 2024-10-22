return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
      "windwp/nvim-ts-autotag", -- auto close and rename html tags using treesitter
    },
    opts = {
      ensure_installed = "all",
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      refactor = {
        highlight_definitions = {
          enable = true,
        },
        -- smart_rename = {
        --   enable = false,
        -- },
      },
      autotag = {
        enable = true,
      },
      context = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
          selection_modes = {
            ["@function.outer"] = "V",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["L"] = "@parameter.inner",
          },
          swap_previous = {
            ["H"] = "@parameter.inner",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      vim.o.foldmethod = "expr"
      vim.o.foldexpr = "nvim_treesitter#foldexpr()"
      vim.o.foldlevelstart = 99
      vim.o.foldenable = false
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      context_commentstring = {
        enable = true,
      },
    },
    main = "ts_context_commentstring",
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },
}