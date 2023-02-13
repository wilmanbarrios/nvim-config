local current_theme = os.getenv('CODE_THEME')

local colorschemes = {
  palenight = function ()
    vim.cmd.colorscheme('palenight')
  end,
  gruvbox_light = function ()
    vim.o.background = 'light'
    vim.cmd.colorscheme('gruvbox')
  end,
  gruvbox = function ()
    vim.o.background = 'dark'
    vim.cmd.colorscheme('gruvbox')
  end,
  nord = function ()
    vim.cmd.colorscheme('nord')
  end,
  tokyonight = function ()
    local util = require("tokyonight.util")

    require("tokyonight").setup({
      style = 'night',
      on_highlights = function(hl, c)
        hl["@text.todo"] = { fg = c.yellow, bg = util.darken(c.yellow, 0.1) }
        hl["@text.danger"] = { fg = c.error, bg = util.darken(c.error, 0.1) }
      end,
    })
    vim.cmd.colorscheme('tokyonight')
  end,
  vscode = function ()
    vim.o.background = 'dark'
    require('vscode').setup({
      italic_comments = true,
    })
  end,
  vscode_light = function ()
    vim.o.background = 'light'
    require('vscode').setup({
      italic_comments = true,
    })
  end,
}

for theme, apply in pairs(colorschemes) do
  if current_theme == theme then
    apply()
  end
end

function change_colorscheme()
  local options = {}
  for k,v in pairs(colorschemes) do
    options[#options + 1] = k
  end

  vim.ui.select(options, {
    prompt = 'Color Schemes:',
  }, function(choice)
      colorschemes[choice]()
      RELOAD 'wdx.colorscheme'
    end)
end

vim.keymap.set('n', '<Leader>cs', change_colorscheme)
