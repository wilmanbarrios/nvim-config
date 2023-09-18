return {
  "tpope/vim-dadbod",
  cmd = "DB",
  keys = {
    {
      mode = "x",
      "<Leader>rq",
      ":DB<CR> | :up<CR>",
      desc = "Visual select any DB queries and run them on the fly",
    },
  },
  dependencies = {
    "tpope/vim-dotenv",
  },
}
