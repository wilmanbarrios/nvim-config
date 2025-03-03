local js = { "biome", "prettierd", "prettier", stop_after_first = true }

return {
  {
    "stevearc/conform.nvim",
    main = "conform",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        -- Disable formatting for Python files
        if vim.bo[bufnr].filetype == "python" then
          return
        end

        return { timeout_ms = 500, lsp_fallback = true }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = js,
        typescript = js,
        typescriptreact = js,
        graphql = { "prettierd" },
        python = {
          -- To run the Ruff formatter.
          "ruff_format",
          -- To organize the imports.
          "ruff_organize_imports",
        },
      },
    },
    init = function()
      -- NOTE: just testing this thing because the docs says: "Expression which
      -- is evaluated to format a range of lines for the |gq| operator or
      -- automatic formatting"

      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })

      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      })
    end,
    keys = {
      {
        mode = { "n", "v" },
        "<leader>ff",
        function()
          require("conform").format({ async = true, lsp_fallback = true })

          local filename = vim.fn.expand("%:t")
          require("fidget").notify(
            string.format("File '...%s' formatted!", filename),
            vim.log.levels.INFO,
            { annote = "conform.nvim" }
          )
        end,
        desc = "Format buffer",
      },
    },
  },
}
