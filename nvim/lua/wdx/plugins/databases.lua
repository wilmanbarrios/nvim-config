return {
  'tpope/vim-dadbod',
  cmd = 'DB',
  keys = {
    { mode = 'v', '<Leader>rq', '<cmd>DB<CR> <Bar> <cmd>up<CR>', desc = "Visual select any DB queries and run them on the fly" }
  },
  dependencies = {
    'tpope/vim-dotenv',
  }
}
