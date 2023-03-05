return {
  'vim-test/vim-test',
  cmd = { 'TestNearest', 'TestFile', 'TestSuit', 'TestLast' },
  dependencies = {
    'benmills/vimux',
  },
  keys = {
    { '<Leader>tr', '<cmd>TestNearest<CR>', desc = 'Run nearest test' },
    { '<Leader>tf', '<cmd>TestFile<CR>', desc = 'Run current test file' },
    { '<Leader>ts', '<cmd>TestSuite --stop-on-failure<CR>', desc = 'Run test suite' },
    { '<Leader>tp', '<cmd>TestLast<CR>', desc = 'Run last test' },
  }
}
