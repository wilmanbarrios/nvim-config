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
        "comment", -- possibly slowing down TS
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
        'help',
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
      vim.cmd[[
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
        " Disable folding at startup.
        set nofoldenable
      ]]
    end,
  },
  {
    'nvim-treesitter/playground',
    cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' }
  },
}
