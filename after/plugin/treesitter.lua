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
  context = {
    enable = true,
  },
}

require'nvim-treesitter.highlight'.set_custom_captures {
  ["constructor"] = "TSConstructor"
}
