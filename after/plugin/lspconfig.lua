local lspconfig = require "lspconfig"
require "wdx.lsp.handlers"
require "wdx.lsp.diagnostic"

local on_attach = function(client, bufnr)
  -- Diagnostics mappings
  local bufopts = {noremap = true, silent = true, buffer = bufnr}
  vim.keymap.set("n", "dn", vim.diagnostic.goto_next, bufopts)
  vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set("n", "dl", vim.diagnostic.open_float, bufopts)

  -- LSP mappings
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
  tailwindcss = {},
  html = {},
  eslint = {},
  prismals = {},
  intelephense = {
    init_options = {
      globalStoragePath = vim.fn.expand("$XDG_DATA_HOME/intelephense"),
      licenceKey = vim.fn.expand("$INTELEPHENSE_LICENCE_KEY"),
    },
  },
  tsserver = {
    commands = {
      OrganizeImports = {
        function()
          vim.lsp.buf.execute_command {
            command = "_typescript.organizeImports",
            arguments = {vim.api.nvim_buf_get_name(0)},
            title = ""
          }
        end,
        description = "Organize Imports"
      }
    }
  },
  vuels = {
    init_options = {
      config = {
        vetur = {
          completion = {
            autoImport = true,
            tagCasing = "initial",
          },
          format = {
            defaultFormatter = {
              -- js = "prettier"
            }
          }
        }
      }
    },
  },
}

for server, opts in pairs(servers) do
  lspconfig[server].setup(vim.tbl_extend("force", {
    on_attach = on_attach,
    capabilities = capabilities,
  }, opts))
end
