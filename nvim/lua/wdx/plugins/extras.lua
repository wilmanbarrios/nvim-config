return {
  'christoomey/vim-tmux-navigator', -- Improved window navigation between tmux panes and vim
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    config = function()
      vim.g.startuptime_tries = 10
    end,
  }, -- Improved vim startuptime profiler
  'lewis6991/impatient.nvim', -- improve nvim startuptime with caching config files
  'lewis6991/spaceless.nvim',
  'mattn/emmet-vim', -- Emmet
  'ryanoasis/vim-devicons',
  'tpope/vim-commentary', -- Commenting
  'tpope/vim-surround', -- sorround things with things
  'tpope/vim-unimpaired', -- extra set of mapping
  'wellle/targets.vim', -- Expand builtin text-objects
  'windwp/nvim-autopairs',
  { 'junegunn/vim-easy-align', cmd = 'EasyAlign' }, -- align stuffs
  {
    'nvim-tree/nvim-web-devicons',
    opts = {
      default = true
    }
  },
}
