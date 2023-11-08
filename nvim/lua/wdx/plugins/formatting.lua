local javascript_formatter = { { "biome", "prettierd", "prettier" } }

return {
  {
    "stevearc/conform.nvim",
    main = "conform",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
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
    init = function()
      -- TODO: just testing this thing because the docs says: "Expression which
      -- is evaluated to format a range of lines for the |gq| operator or
      -- automatic formatting"

      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    keys = {
      {
        mode = { "n", "v" },
        "<leader>ff",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        desc = "Format buffer",
      },
    },
  },
}
