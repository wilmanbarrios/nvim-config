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
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    -- priority = 1000,
    config = function()
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        italic_comments = true,
        disable_nvimtree_bg = true,
        color_overrides = {
          -- vscBack = '#000000',
        },
        group_overrides = {
          ["@variable"] = { fg = c.vscBlue, bg = c.none },
          ["@variable.builtin"] = { fg = c.vscBlue, bg = c.none },

          ["@lsp.typemod.variable.defaultLibrary"] = {
            link = "@type",
          },
          ["@lsp.typemod.type.defaultLibrary"] = { link = "@type" },
          ["@lsp.typemod.variable"] = { link = "@variable" },
          -- ['@lsp.typemod.variable.declaration'] = { link = '@variable' },

          -- spell
          SpellBad = {
            fg = c.none,
            bg = c.none,
            undercurl = true,
            sp = c.vscRed,
          },
          SpellCap = {
            fg = c.none,
            bg = c.none,
            undercurl = true,
            sp = c.vscRed,
          },
          SpellRare = {
            fg = c.none,
            bg = c.none,
            undercurl = true,
            sp = c.vscRed,
          },
          SpellLocal = {
            fg = c.none,
            bg = c.none,
            undercurl = true,
            sp = c.vscRed,
          },

          ModeMsg = { fg = c.vsFront, bg = c.none },
          WarningMsg = { fg = c.vscYellowOrange, bg = c.none },

          -- GitBranch = { fg = c.blue, bg = c.bg_statusline }
        },
      })
      -- require('vscode').load()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- lazy = true,
    config = function()
      require("catppuccin").setup({})
      -- vim.cmd.colorscheme('catppuccin-mocha')
    end,
  },
}
