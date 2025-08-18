return {
  {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    lazy = false,
    branch = "master",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    init = function()
      vim.o.foldenable = false
      vim.o.foldlevelstart = 99
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
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
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    main = "treesitter-context",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      enable = true,
    },
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "InsertEnter",
    opts = {
      context_commentstring = {
        enable = false,
      },
    },
    main = "ts_context_commentstring",
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
}
