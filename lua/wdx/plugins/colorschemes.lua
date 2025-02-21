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
      -- vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    enable = false,
    priority = 1000,
    opts = function()
      -- local c = require("vscode.colors").get_colors()

      return {
        italic_comments = true,
        disable_nvimtree_bg = true,
        -- group_overrides = {
        --   ["@variable"] = { fg = c.vscBlue, bg = c.vscNone },
        --   ["@variable.builtin"] = { fg = c.vscBlue, bg = c.vscNone },
        --
        --   ["@lsp.typemod.variable.defaultLibrary"] = { link = "@type" },
        --   ["@lsp.typemod.type.defaultLibrary"] = { link = "@type" },
        --   ["@lsp.typemod.variable"] = { link = "@constant" },
        --   -- ['@lsp.typemod.variable.declaration'] = { link = '@variable' },
        --
        --   ["@type.builtin"] = { link = "@type" },
        --   ["@tag.tsx"] = { link = "@type" },
        --
        --   SpecialChar = { link = "Special" },
        --   ["@string.regexp"] = { fg = c.vscLightRed, bg = c.vscNone },
        --   ["@character.special"] = { fg = c.vscBlue, bg = c.vscNone },
        --
        --   -- spell
        --   SpellBad = {
        --     fg = c.vscNone,
        --     bg = c.vscNone,
        --     undercurl = true,
        --     sp = c.vscRed,
        --   },
        --   SpellCap = {
        --     fg = c.vscNone,
        --     bg = c.vscNone,
        --     undercurl = true,
        --     sp = c.vscRed,
        --   },
        --   SpellRare = {
        --     fg = c.vscNone,
        --     bg = c.vscNone,
        --     undercurl = true,
        --     sp = c.vscRed,
        --   },
        --   SpellLocal = {
        --     fg = c.vscNone,
        --     bg = c.vscNone,
        --     undercurl = true,
        --     sp = c.vscRed,
        --   },
        --
        --   ModeMsg = { fg = c.vscFront, bg = c.vscNone },
        --   WarningMsg = { fg = c.vscYellowOrange, bg = c.vscNone },
        --
        --   GitBranch = { fg = c.vscGreen, bg = c.vscNone },
        --
        --   NonText = {
        --     fg = c.vscLineNumber,
        --     bg = c.vscNone,
        --   },
        -- },
      }
    end,
    config = function(_, opts)
      local vscode = require("vscode")
      vscode.setup(opts)
      vscode.load()
    end,
  },
}
