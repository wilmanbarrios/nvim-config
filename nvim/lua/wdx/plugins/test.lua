return {
  'vim-test/vim-test',
  cmd = { 'TestNearest', 'TestFile', 'TestSuit', 'TestLast' },
  dependencies = {
    'benmills/vimux',
  },
  config = function()
    vim.g.VimuxHeight = '40'
    vim.g.VimuxOrientation = 'h'
    vim.g['test#neovim#term_position'] = "vert botright 98"
    vim.g['test#strategy'] = "vimux"
    vim.g['test#php#dusk#executable'] = "php artisan dusk --pest"
  end,
  keys = {
    { '<Leader>tr', '<cmd>TestNearest<CR>', desc = 'Run nearest test' },
    { '<Leader>tf', '<cmd>TestFile<CR>', desc = 'Run current test file' },
    { '<Leader>ts', '<cmd>TestSuite --stop-on-failure<CR>', desc = 'Run test suite' },
    { '<Leader>tp', '<cmd>TestLast<CR>', desc = 'Run last test' },
  }
}
