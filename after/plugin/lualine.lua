require('lualine').setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      {
        'branch',
        color = 'GitBranch',
      },
    },
    lualine_b = { },
    lualine_c = {
      '%=',
      {
        'filename',
        path = 1,
        file_status = true
      },
    },
    lualine_x = {
      'diff',
      'diagnostics',
      'filetype',
      'progress',
    },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'diff', 'diagnostics', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {},
  },
}
