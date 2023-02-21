require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
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
}

vim.cmd[[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" Disable folding at startup.
set nofoldenable
]]
