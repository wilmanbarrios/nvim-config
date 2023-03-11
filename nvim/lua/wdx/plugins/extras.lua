return {
  { 'christoomey/vim-tmux-navigator', event = "VeryLazy" }, -- Improved window navigation between tmux panes and vim
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    config = function()
      vim.g.startuptime_tries = 10
    end,
  }, -- Improved vim startuptime profiler
  { 'lewis6991/spaceless.nvim', event = { "BufReadPre", "BufNewFile" } },
  { 'mattn/emmet-vim', event = { "BufReadPre", "BufNewFile" } }, -- Emmet
  -- 'ryanoasis/vim-devicons',
  { 'tpope/vim-commentary', event = { "BufReadPre", "BufNewFile" } }, -- Commenting
  { 'tpope/vim-surround', event = { "BufReadPre", "BufNewFile" } }, -- sorround things with things
  { 'tpope/vim-unimpaired', event = { "BufReadPre", "BufNewFile" } }, -- extra set of mapping
  { 'wellle/targets.vim', event = { "BufReadPre", "BufNewFile" } }, -- Expand builtin text-objects
  { 
    'windwp/nvim-autopairs',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-autopairs").setup()
    end
  },
  { 'junegunn/vim-easy-align', cmd = 'EasyAlign' }, -- align stuffs
}
