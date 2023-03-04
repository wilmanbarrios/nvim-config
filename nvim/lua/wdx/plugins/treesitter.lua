-- TODO: folding
--[[
vim.cmd[[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" Disable folding at startup.
set nofoldenable
]]
--]]
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    opts = {
      ensure_installed = {
        "javascript",
        "comment", -- possibly slowing down TS
        'css',
        'diff',
        'gitattributes',
        'gitcommit',
        'graphql',
        'help',
        'html',
        'jsdoc',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'php',
        'phpdoc',
        'prisma',
        'regex',
        'sql',
        'tsx',
        'typescript',
        'yaml',
        'query'
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
    end,
  },
  {
    'nvim-treesitter/playground',
    cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' }
  },
}
