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
    vim.cmd.colorscheme('tokyonight')
  end,
  vscode = function ()
    vim.o.background = 'dark'
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
