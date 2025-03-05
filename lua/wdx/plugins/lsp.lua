return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "pmizio/typescript-tools.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("wdx.lsp")
      vim.g.markdown_fenced_languages = {
        "ts=typescript",
      }
    end,
  },

  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "LspAttach",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      ui = {
        title = false,
        border = "rounded",
      },
      lightbulb = {
        enable = true,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
    },
  },

  -- {
  --   "mfussenegger/nvim-lint",
  --   config = function()
  --     local lint = require("lint")
  --     local javascript_opts = {
  --       "biomejs",
  --       -- "eslint_d",
  --     }

  --     lint.linters_by_ft = {
  --       javascript = javascript_opts,
  --       javascriptreact = javascript_opts,
  --       typescript = javascript_opts,
  --       typescriptreact = javascript_opts,
  --     }

  --     vim.api.nvim_create_autocmd(
  --       { "BufEnter", "BufWritePost", "InsertLeave" },
  --       {
  --         callback = function()
  --           lint.try_lint()
  --         end,
  --       }
  --     )
  --   end,
  -- },
}
