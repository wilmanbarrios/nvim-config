require('lualine').setup {
  options = {
    globalstatus = true,
    theme = 'auto',
    component_separators = { left = '', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      winbar = {
        'fugitive',
        'gitcommit',
      },
    },
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      '[[👉]]',
      {
        'filename',
        path = 1,
        file_status = true
      },
    },
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      '[[  ]]', -- just a placeholder to prevent text jumpings
      {
        'filename',
        path = 1,
        file_status = true
      },
    },
  },
  sections = {
    lualine_a = {},
    lualine_b = {
      {
        'branch',
        color = '@type',
      }
    },
    lualine_c = {},
    lualine_x = {
      'diff',
      'diagnostics',
      'filetype',
      'location',
      'progress',
    },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {
      'diff',
      'diagnostics',
      'filetype',
      'progress',
      'location'
    },
    lualine_y = {},
    lualine_z = {},
  },
}
