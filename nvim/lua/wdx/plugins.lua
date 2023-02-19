local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    --- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      }
    }

    --- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      requires = {
        'nvim-treesitter/nvim-treesitter-refactor',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/nvim-treesitter-context',
        {
          'nvim-treesitter/playground',
          opt = true,
          cmd = {'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor'}
        },
      }
    }

    --- LSP
    use 'neovim/nvim-lspconfig'
    --- LSP UIs
    use {
      "glepnir/lspsaga.nvim",
      branch = "main",
      requires = {
        {"nvim-tree/nvim-web-devicons"},
        {"nvim-treesitter/nvim-treesitter"},
      }
    }
    --- LSP completions
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'onsails/lspkind-nvim', -- LSP completion kind
      }
    }
    use 'L3MON4D3/LuaSnip' -- Snippets
    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      }
    }

    --- Statusline
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    --- File explorer
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
    }

    --- Refactoring
    use {
      "ThePrimeagen/refactoring.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter"
      }
    }
    --- Another refactor tool only for PHP
    use  {
      'phpactor/phpactor',
      ft = {'php'},
      branch = 'master',
      run = 'composer install --no-dev -o',
      disable = true,
    }

    --- Git integration with vim
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb' -- allow my to yank a link to specific lines in files with ease

    --- Show git signs in gutter
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      }
    }

    --- Test Runner, run any kind of test suite with ease
    use 'vim-test/vim-test'
    use 'benmills/vimux'

    --- Database management, visaul select any DB queries and run them on the fly
    use 'tpope/vim-dadbod'
    use 'tpope/vim-dotenv'

    --- Miscellaneous
    use 'lewis6991/impatient.nvim' -- improve nvim startuptime with caching config files
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired' -- extra set of mapping
    use 'wellle/targets.vim' -- Expand builtin text-objects
    use 'mattn/emmet-vim' -- Emmet
    use { 'junegunn/vim-easy-align', opt = true, cmd = {'EasyAlign'} } -- align stuffs
    use 'tpope/vim-commentary' -- Commenting
    use 'windwp/nvim-ts-autotag' -- auto close and rename html tags using treesitter
    use 'JoosepAlviste/nvim-ts-context-commentstring' -- Change commentstring on the fly
    use {'dstein64/vim-startuptime', opt = true, cmd = 'StartupTime'} -- Improved vim startuptime profiler
    -- Pairs any (,{,[,",',`
    use {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end
    }
    use 'christoomey/vim-tmux-navigator' -- Improved window navigation between tmux panes and vim
    -- Remove extra whitespaces, but only the ones that I add.
    use {
      'lewis6991/spaceless.nvim',
      config = function()
        require'spaceless'.setup()
      end
    }
    -- DevIcons integration with neovim
    use 'ryanoasis/vim-devicons'
    use {
      'kyazdani42/nvim-web-devicons',
      config = function()
        require'nvim-web-devicons'.setup {
          default = true
        }
      end
    }

    --- Colorschemes
    use 'folke/tokyonight.nvim'
    use 'Mofiqul/vscode.nvim'

    if packer_bootstrap then
      packer.sync()
    end
  end
}
