local lspconfig = require "lspconfig"
require "wdx.lsp.handlers"
require "wdx.lsp.diagnostic"

local keymap = vim.keymap.set

local on_attach = function(client, bufnr)
  local bufopts = { buffer = bufnr }

  -- Diagnostics mappings
  -- keymap("n", "dp", vim.diagnostic.goto_prev, bufopts)
  -- keymap("n", "dn", vim.diagnostic.goto_next, bufopts)
  -- keymap("n", "dl", vim.diagnostic.open_float, bufopts)
  -- keymap("n", "ds", vim.diagnostic.show, bufopts)
  -- keymap("n", "dh", vim.diagnostic.hide, bufopts)

  -- LSP mappings
  -- keymap("n", "gd", vim.lsp.buf.definition, bufopts)
  -- keymap("n", "K", vim.lsp.buf.hover, bufopts)
  keymap("n", "gD", vim.lsp.buf.implementation, bufopts)
  keymap("i", "<c-k>", vim.lsp.buf.signature_help, bufopts)
  keymap("n", "<Leader>D", vim.lsp.buf.type_definition, bufopts)
  keymap("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)
  keymap("n", "<Leader>ff", function()
    vim.lsp.buf.format({ timeout_ms = 20000 })
  end, bufopts)

  --- LSP Saga
  keymap("n", "gd", '<cmd>Lspsaga goto_definition<CR>', bufopts)
  keymap("n", "<Leader>D", '<cmd>Lspsaga goto_type_definition<CR>', bufopts)
  keymap("n", "dp", '<cmd>Lspsaga diagnostic_jump_prev<CR>', bufopts)
  keymap("n", "dn", '<cmd>Lspsaga diagnostic_jump_next<CR>', bufopts)
  keymap("n", "dl", '<cmd>Lspsaga show_line_diagnostics<CR>', bufopts)
  keymap("n", "K", '<cmd>Lspsaga hover_doc<CR>', bufopts)

  -- disable `tsserver` formatting in favor of null-ls `prettierd` formatting
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
  end
  if client.name == "denols" then
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
  end
end

local servers = {
  -- tailwindcss = {},
  -- intelephense = {
  --   init_options = {
  --     globalStoragePath = os.getenv("XDG_DATA_HOME") .. "/intelephense",
  --     licenceKey = os.getenv("INTELEPHENSE_LICENCE_KEY"),
  --   },
  -- },
  denols = {
    autostart = false,
    init_options = {
      enable = true,
      unstable = true,
      suggest = {
        imports = {
          hosts = {
            ["https://crux.land"] = false,
            ["https://deno.land"] = false,
            ["https://x.nest.land"] = false
          }
        }
      }
    }
  },
  eslint = {},
  tsserver = {
    cmd = {
      os.getenv("LSP_NODE_PATH") .. '/node',
      os.getenv("LSP_NODE_PATH") .. '/typescript-language-server',
      '--tsserver-path', os.getenv("LSP_NODE_PATH") .. '/tsserver',
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
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

for server, opts in pairs(servers) do
  lspconfig[server].setup(vim.tbl_extend("force", {
    on_attach = on_attach,
    capabilities = capabilities,
    -- flags = {
    --   debounce_text_changes = 200
    -- }
  }, opts))
end
