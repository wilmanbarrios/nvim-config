return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'JoosepAlviste/nvim-ts-context-commentstring', -- Change commentstring on the fly
      'windwp/nvim-ts-autotag', -- auto close and rename html tags using treesitter
    },
    opts = {
      ensure_installed = {
        "comment",
        "javascript",
        'bash',
        'css',
        'diff',
        'dockerfile',
        'gitattributes',
        'gitcommit',
        'git_config',
        'git_rebase',
        'gitignore',
        'graphql',
        'html',
        'jsdoc',
        'json',
        'jsonc',
        'lua',
        'luadoc',
        'luap',
        'make',
        'markdown',
        'markdown_inline',
        'php',
        'phpdoc',
        'prisma',
        'query',
        'regex',
        'sql',
        'scss',
        'toml',
        'tsx',
        'typescript',
        'yaml',
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      },
      context_commentstring = {
        enable = true
      },
      refactor = {
        highlight_definitions = {
          enable = true
        },
        smart_rename = {
          enable = true,
        },
      },
      autotag = {
        enable = true,
      },
      context = {
        enable = true,
        max_lines = 10, -- How many lines the window should span. Values <= 0 mean no limit.
      },
      textobjects = {
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
      require'nvim-treesitter.configs'.setup(opts)
      vim.o.foldmethod = "expr"
      vim.o.foldexpr = "nvim_treesitter#foldexpr()"
      vim.o.foldlevelstart = 99
      vim.o.foldenable = false
    end,
  },
}
