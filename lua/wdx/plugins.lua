local packer = require('packer')

packer.init {
  git = {
    clone_timeout = 120,
  },
  display = {
    open_cmd = 'vnew [packer]'
  }
}

return packer.startup {
  function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'

    -- Show git signs in gutter
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      }
    }

    -- Pairs any (,{,[,",',`
    use {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end
    }

    -- Improved window navigation between tmux panes and vim
    use 'christoomey/vim-tmux-navigator'

    -- Refactoring
    use  {
      'phpactor/phpactor',
      ft = {'php'},
      branch = 'master',
      run = 'composer install --no-dev -o'
    }

    -- Git integration with vim
    use 'tpope/vim-fugitive'

    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'

    -- Commenting
    use 'tpope/vim-commentary'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- File explorer
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
    }

    -- Test Runner
    use { 'vim-test/vim-test', ft = {'php'} }
    use { 'benmills/vimux', ft = {'php'} }

    -- Expand builtin text-objects
    use 'wellle/targets.vim'

    -- Emmet
    use 'mattn/emmet-vim'

    -- align stuffs
    use { 'junegunn/vim-easy-align', opt = true, cmd = {'EasyAlign'} }

    -- Snippets
    use 'L3MON4D3/LuaSnip'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- LSP completions
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
      }
    }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim'
      }
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'nvim-telescope/telescope-ui-select.nvim'

    -- DevIcons integration with neovim
    use {
      'kyazdani42/nvim-web-devicons',
      config = function()
        require'nvim-web-devicons'.setup {
          default = true
        }
      end
    }
    use 'ryanoasis/vim-devicons'

    -- Treessitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
      'nvim-treesitter/playground',
      opt = true,
      cmd = {'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor'}
    }
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-context'

    -- auto close and rename html tags using treesitter
    use 'windwp/nvim-ts-autotag'

    -- Statusline
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Improved vim startuptime profiler
    use {'dstein64/vim-startuptime', opt = true, cmd = 'StartupTime'}

    use 'onsails/lspkind-nvim'

    -- Spell check
    use {
      'lewis6991/spellsitter.nvim',
      config = function()
        require('spellsitter').setup()
      end
    }

    -- Database management
    use 'tpope/vim-dadbod'
    use 'tpope/vim-dotenv'


    -- Colorschemes
    use '~/Code/Repos/palenight.nvim'
    use '~/Code/Repos/github-nvim-theme'
    use 'shaunsingh/nord.nvim'
    use "ellisonleao/gruvbox.nvim"
    use 'Mofiqul/vscode.nvim'
  end
}
