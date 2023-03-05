return {
   {
     'folke/tokyonight.nvim',
     priority = 1000,
     config = function()
       vim.cmd.colorscheme('tokyonight-night')
     end,
     opts = function()
       local util = require("tokyonight.util")
       return {
         style = 'night',
         on_highlights = function(hl, c)
           hl["@text.todo"] = { fg = c.yellow, bg = util.darken(c.yellow, 0.2) }
           hl["@text.danger"] = { fg = c.error, bg = util.darken(c.error, 0.2) }
           -- comment
           hl["@comment"] = { fg = util.lighten(c.comment, 0.5) }
         end,
       }
     end,
   },
   {
     'Mofiqul/vscode.nvim',
     lazy = true,
   },
}