local lspconfig = require("lspconfig")
require("wdx.lsp.handlers")
require("wdx.lsp.diagnostic")

local keymap = vim.keymap.set

local on_attach = function(client, bufnr)
  local bufopts = { buffer = bufnr }

  -- Builtin LSP
  keymap("n", "gD", vim.lsp.buf.implementation, bufopts)
  keymap("i", "<c-k>", vim.lsp.buf.signature_help, bufopts)
  keymap("n", "<Leader>D", vim.lsp.buf.type_definition, bufopts)
  keymap("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)
  -- keymap("n", "K", vim.lsp.buf.hover, bufopts)
  -- keymap("n", "<Leader>ff", function()
  --   vim.lsp.buf.format({ timeout_ms = 20000 })
  -- end, bufopts)

  --- LSP Saga
  keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", bufopts)
  keymap("n", "<Leader>D", "<cmd>Lspsaga goto_type_definition<CR>", bufopts)
  keymap("n", "dp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
  keymap("n", "dn", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
  keymap("n", "dl", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
end

local servers = {
  tailwindcss = {},
  lua_ls = {
    on_init = function(client)
      local path = client.workspace_folders[1].name
      if
        not vim.loop.fs_stat(path .. "/.luarc.json")
        and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
      then
        client.config.settings =
          vim.tbl_deep_extend("force", client.config.settings, {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                  -- "${3rd}/luv/library"
                  -- "${3rd}/busted/library",
                },
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
              },
            },
          })

        client.notify(
          "workspace/didChangeConfiguration",
          { settings = client.config.settings }
        )
      end
      return true
    end,
  },
  intelephense = {
    autostart = false,
    init_options = {
      globalStoragePath = os.getenv("XDG_DATA_HOME") .. "/intelephense",
      licenceKey = os.getenv("INTELEPHENSE_LICENCE_KEY"),
    },
  },
  -- eslint = {},
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for server, opts in pairs(servers) do
  lspconfig[server].setup(vim.tbl_extend("force", {
    on_attach = on_attach,
    capabilities = capabilities,
  }, opts))
end

require("typescript-tools").setup({
  on_attach = function(...)
    local ts_tools = require("typescript-tools.api")

    keymap("n", "gsd", ts_tools.go_to_source_definition)

    on_attach(...)
  end,
  settings = {
    tsserver_path = os.getenv("LSP_NODE_PATH") .. "/tsserver",
  },
})
