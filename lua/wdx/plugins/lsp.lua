return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
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
}
