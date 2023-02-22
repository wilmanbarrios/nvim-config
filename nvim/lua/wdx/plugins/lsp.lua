return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('wdx.lsp')
    end
  },

  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      ui = {
        title = false,
        border = 'rounded',
      },
      lightbulb = {
        enable = true,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = false,
      },
      symbol_in_winbar = {
        enable = false
      },
    }
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          --- Prettier
          null_ls.builtins.formatting.prettierd,
          -- Eslint
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.code_actions.eslint_d,
          -- null_ls.builtins.formatting.eslint_d,
        },
      })
    end
  },
}
