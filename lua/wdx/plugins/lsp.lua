return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
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
}
