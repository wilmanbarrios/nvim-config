return {
  'nvim-telescope/telescope.nvim',
  config = function()
    require "wdx.telescope.setup"
    require "wdx.telescope.mappings"
  end,
  dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  }
}
