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
  { 'windwp/nvim-autopairs', config = true, event = { "BufReadPre", "BufNewFile" } },
  { 'junegunn/vim-easy-align', cmd = 'EasyAlign' }, -- align stuffs
  {
    'nvim-pack/nvim-spectre',
    main = 'spectre',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
      mappings = {
        ['send_to_qf'] = {}
      }
    },
    keys = {
      { "<leader>sr", '<cmd>lua require("spectre").open()<CR>', desc = "Open Spectre" },
      { mode = 'v', "<leader>sr", '<esc><cmd>lua require("spectre").open_visual()<CR>', desc = "Search current word" },
    },
  },
  {
    'j-hui/fidget.nvim',
    event = { "BufReadPre", "BufNewFile" },
    tag = 'legacy',
    config = function()
      require("fidget").setup()
    end
  },

  -- highlight hex color
  {
    'NvChad/nvim-colorizer.lua',
    event = { "BufReadPre", "BufNewFile" },
    main = 'colorizer',
    config = true,
  },
}
