return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      globalstatus = true,
      theme = "auto",
      component_separators = { left = "", right = "|" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        winbar = {
          "fugitive",
          "gitcommit",
          "NvimTree",
          "dashboard",
          "",
        },
      },
    },
    winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        "[[⭐️]]",
        {
          "filetype",
          icon_only = true,
          colored = true,
        },
        {
          "filename",
          path = 1,
          file_status = true,
        },
      },
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        "[[  ]]", -- just a placeholder to prevent text jumpings
        {
          "filetype",
          icon_only = true,
          colored = true,
        },
        {
          "filename",
          path = 1,
          file_status = true,
        },
      },
    },
    sections = {
      lualine_a = {},
      lualine_b = {
        {
          "branch",
          color = "GitBranch",
        },
      },
      lualine_c = {},
      lualine_x = {
        "diff",
        "diagnostics",
        "location",
        "progress",
      },
      lualine_y = {},
      lualine_z = {},
    },
  },
}
