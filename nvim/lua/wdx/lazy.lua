local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {



  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G', 'GBrowse' },
    dependencies = {
      'tpope/vim-rhubarb', -- allow my to yank a link to specific lines in files with ease
    }
  },

    --- Show git signs in gutter
    {
      'lewis6991/gitsigns.nvim',
      dependencies = {
        'nvim-lua/plenary.nvim'
      }
    },

    --- Test Runner, run any kind of test suite with ease
     {
       'vim-test/vim-test',
       lazy = true,
       cmd = { 'TestNearest', 'TestFile', 'TestSuit', 'TestLast' },
       dependencies = {
         'benmills/vimux',
       }
     },

    --- Database management
     {
       'tpope/vim-dadbod',
       lazy = true,
       cmd = 'DB',
       keys = {
         { mode = 'v', '<Leader>rq', '<cmd>DB<CR> <Bar> <cmd>up<CR>', desc = "Visual select any DB queries and run them on the fly" }
       },
       dependencies = {
         'tpope/vim-dotenv',
       }
     },

     --- Miscellaneous
     'lewis6991/impatient.nvim', -- improve nvim startuptime with caching config files
     'tpope/vim-surround',
     'tpope/vim-unimpaired', -- extra set of mapping
     'wellle/targets.vim', -- Expand builtin text-objects
     'mattn/emmet-vim', -- Emmet
     { 'junegunn/vim-easy-align', lazy = true, cmd = 'EasyAlign' }, -- align stuffs
     'tpope/vim-commentary', -- Commenting
     'windwp/nvim-ts-autotag', -- auto close and rename html tags using treesitter
     'JoosepAlviste/nvim-ts-context-commentstring', -- Change commentstring on the fly
     {'dstein64/vim-startuptime', lazy = true, cmd = 'StartupTime'}, -- Improved vim startuptime profiler
     'windwp/nvim-autopairs',
     'christoomey/vim-tmux-navigator', -- Improved window navigation between tmux panes and vim
     'lewis6991/spaceless.nvim',
     'ryanoasis/vim-devicons',
     {
       'kyazdani42/nvim-web-devicons',
       opts = {
         default = true
       }
     },

    --- Colorschemes
    'folke/tokyonight.nvim',
    'Mofiqul/vscode.nvim',
}

require("lazy").setup('wdx.plugins')
