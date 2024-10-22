return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = function()
      local util = require("tokyonight.util")

      return {
        style = "night",
        on_highlights = function(hl, c)
          hl.GitBranch = { fg = c.blue, bg = c.bg_statusline }
          hl.Todo = { fg = c.yellow, bg = util.darken(c.yellow, 0.2) }
          hl["@text.danger"] = { fg = c.error, bg = util.darken(c.error, 0.2) }
          hl["@comment"] = { fg = util.lighten(c.comment, 0.8) }
          hl.LineNr = { fg = util.lighten(c.comment, 1) }
        end,
      }
    end,
    config = function(_, opts)
      require("tokyonight").setup(opts)
      -- vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "rose-pine/neovim",
    priority = 1000,
    name = "rose-pine",
    opts = {
      styles = {
        italic = false,
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      vim.cmd.colorscheme("rose-pine")
    end,
  },
}
