return {
  'nvim-treesitter/nvim-treesitter',
  cmd = 'TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/nvim-treesitter-context',
    {
      'nvim-treesitter/playground',
      cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' }
    },
  }
}
