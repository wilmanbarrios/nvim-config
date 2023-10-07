local javascript_formatter = { { "biome", "prettierd", "prettier" } }

return {
  {
    "stevearc/conform.nvim",
    main = "conform",
    opts = {
      log_level = vim.log.levels.DEBUG,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = javascript_formatter,
        typescript = javascript_formatter,
        typescriptreact = javascript_formatter,
      },
    },
  },
}
