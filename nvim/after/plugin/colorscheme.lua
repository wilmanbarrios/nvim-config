local current_theme = vim.fn.expand('$CODE_THEME')

local colorschemes = {
  palenight = function ()
    vim.cmd[[colorscheme palenight]]
  end,
  gruvbox = function ()
    vim.cmd[[colorscheme gruvbox]]
  end,
  nord = function ()
    vim.cmd[[colorscheme nord]]
  end,
  tokyonight = function ()
    vim.cmd[[colorscheme tokyonight]]
  end,
  vscode = function ()
    require('vscode').setup({
      -- Enable transparent background
      transparent = false,

      -- Enable italic comment
      italic_comments = true,

      -- Disable nvim-tree background color
      disable_nvimtree_bg = true,
    })
  end,
}

for theme, apply in pairs(colorschemes) do
  if current_theme == theme then
    apply()
  end
end
