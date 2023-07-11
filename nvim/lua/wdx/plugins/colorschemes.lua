return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = function()
      local util = require("tokyonight.util")
      return {
        style = 'night',
        on_highlights = function(hl, c)
          hl.Todo = { fg = c.yellow, bg = util.darken(c.yellow, 0.2) }
          hl["@text.danger"] = { fg = c.error, bg = util.darken(c.error, 0.2) }
          hl["@comment"] = { fg = util.lighten(c.comment, 0.8) }
          hl.LineNr = { fg = util.lighten(c.comment, 1) }
        end,
      }
    end,
    config = function(_, opts)
      require('tokyonight').setup(opts)
      vim.cmd.colorscheme('tokyonight')
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    -- config = function(_, opts)
    --   require("catppuccin").setup({})
    --   vim.cmd.colorscheme('catppuccin-mocha')
    -- end,
  }
}
