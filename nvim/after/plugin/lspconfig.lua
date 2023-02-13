local lspconfig = require "lspconfig"
require "wdx.lsp.handlers"
require "wdx.lsp.diagnostic"

local on_attach = function(client, bufnr)
  -- Diagnostics mappings
  local bufopts = {noremap = true, silent = true, buffer = bufnr}
  vim.keymap.set("n", "dn", vim.diagnostic.goto_next, bufopts)
  vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set("n", "dl", vim.diagnostic.open_float, bufopts)
  vim.keymap.set("n", "ds", vim.diagnostic.show, bufopts)
  vim.keymap.set("n", "dh", vim.diagnostic.hide, bufopts)

  -- LSP mappings
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<Leader>ff", function()
    vim.lsp.buf.format({ async = false, bufnr = bufnr })
  end, bufopts)

  -- disable `tsserver` formatting in favor of null-ls `prettierd` formatting
  if client.name == "tsserver" then
    -- client.resolved_capabilities.document_formatting = false -- 0.7 and earlier
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local servers = {
  tailwindcss = {},
  html = {},
  cssls = {},
  prismals = {},
  intelephense = {
    init_options = {
      globalStoragePath = os.getenv("XDG_DATA_HOME") .. "/intelephense",
      licenceKey = os.getenv("INTELEPHENSE_LICENCE_KEY"),
    },
  },
  tsserver = {
    cmd = {
      '/Users/developer/.local/share/nvm/versions/node/v14.16.0/bin/node',
      '/Users/developer/.local/share/nvm/versions/node/v14.16.0/bin/typescript-language-server',
      '--stdio'
    },
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
  vuels = {},
}

for server, opts in pairs(servers) do
  lspconfig[server].setup(vim.tbl_extend("force", {
    on_attach = on_attach,
    capabilities = capabilities,
  }, opts))
end
