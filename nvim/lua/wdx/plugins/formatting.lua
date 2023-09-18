return {
  {
    "stevearc/conform.nvim",
    main = "conform",
    opts = {
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" }, "eslint_d" },
        typescript = { { "prettierd", "prettier" }, "eslint_d" },
        typescriptreact = { { "prettierd", "prettier" }, "eslint_d" },
      },
    },
  },
}
