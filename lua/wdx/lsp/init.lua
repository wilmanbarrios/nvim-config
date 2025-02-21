local lspconfig = require("lspconfig")
require("wdx.lsp.handlers")
require("wdx.lsp.diagnostic")

local keymap = vim.keymap.set

local on_attach = function(client, bufnr)
  local bufopts = { buffer = bufnr, noremap = true }

  -- Builtin LSP
  keymap("n", "gD", vim.lsp.buf.implementation, bufopts)
  keymap("i", "<c-k>", vim.lsp.buf.signature_help, bufopts)
  keymap("n", "<Leader>D", vim.lsp.buf.type_definition, bufopts)
  keymap("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)

  --- LSP Saga
  keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", bufopts)
  -- Goto definition in a vsplit window
  keymap("n", "gO", "<cmd>vs | Lspsaga goto_definition<CR>", bufopts)
  keymap("n", "<Leader>D", "<cmd>Lspsaga goto_type_definition<CR>", bufopts)
  keymap("n", "dp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
  keymap("n", "dn", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
  keymap("n", "dl", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
  keymap("n", "grr", "<cmd>Lspsaga rename mode=i<CR>", bufopts)

  vim.o.tagfunc = "v:lua.vim.lsp.tagfunc"
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = on_attach,
})

local servers = {
  -- tailwindcss = {},
  -- graphql = {},

  --- Python
  --- pyright: static type checker
  pyright = {
    settings = {
      pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
      },
      python = {
        pythonPath = ".venv/bin/python",
        analysis = {
          -- Ignore all files for analysis to exclusively use Ruff for linting
          ignore = { "*" },
        },
      },
    },
  },
  --- ruff: an extremely fast Python linter and code formatter
  ruff = {},

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
                version = "LuaJIT",
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                },
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
  -- intelephense = {
  --   autostart = false,
  --   init_options = {
  --     globalStoragePath = os.getenv("XDG_DATA_HOME") .. "/intelephense",
  --     licenceKey = os.getenv("INTELEPHENSE_LICENCE_KEY"),
  --   },
  -- },
  eslint = {},
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for server, opts in pairs(servers) do
  lspconfig[server].setup(vim.tbl_extend("force", {
    capabilities = capabilities,
  }, opts))
end

require("typescript-tools").setup({
  settings = {
    tsserver_plugins = {
      "@styled/typescript-styled-plugin",
    },
  },
  on_attach = function(...)
    local ts_tools = require("typescript-tools.api")

    keymap("n", "gsd", ts_tools.go_to_source_definition)

    on_attach(...)
  end,
})
