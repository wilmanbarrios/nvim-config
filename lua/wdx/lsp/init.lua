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
  keymap(
    "n",
    "gO",
    "<cmd>vs | Lspsaga goto_definition<CR>",
    vim.tbl_extend("force", bufopts, {
      desc = "Goto definition in a vsplit window",
    })
  )
  keymap("n", "<Leader>D", "<cmd>Lspsaga goto_type_definition<CR>", bufopts)
  keymap("n", "dp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
  keymap("n", "dn", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
  keymap("n", "dl", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
  keymap("n", "grr", "<cmd>Lspsaga rename mode=n<CR>", bufopts)
end

local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)

local servers = {
  eslint = true,
  tailwindcss = true,
  ruff = true,
  ts_ls = true,
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
  lua_ls = {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
          path ~= vim.fn.stdpath("config")
          and (
            vim.loop.fs_stat(path .. "/.luarc.json")
            or vim.loop.fs_stat(path .. "/.luarc.jsonc")
          )
        then
          return
        end
      end

      client.config.settings.Lua =
        vim.tbl_deep_extend("force", client.config.settings.Lua, {
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
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            },
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
            -- library = vim.api.nvim_get_runtime_file("", true)
          },
        })
    end,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  -- intelephense = {
  --   autostart = false,
  --   init_options = {
  --     globalStoragePath = os.getenv("XDG_DATA_HOME") .. "/intelephense",
  --     licenceKey = os.getenv("INTELEPHENSE_LICENCE_KEY"),
  --   },
  -- },
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = vim.tbl_keys(servers),
  handlers = {
    function(server_name)
      local opts = {}
      if type(servers[server_name]) == "table" then
        ---@diagnostic disable-next-line: cast-local-type
        opts = servers[server_name]
      end

      lspconfig[server_name].setup(vim.tbl_deep_extend("force", {
        capabilities = capabilities,
      }, opts))
    end,

    ts_ls = function()
      require("typescript-tools").setup({
        settings = {
          tsserver_plugins = {
            "@styled/typescript-styled-plugin",
          },
        },
        on_attach = function(...)
          local ts_tools = require("typescript-tools.api")

          keymap("n", "gsd", ts_tools.go_to_source_definition)
        end,
      })
    end,
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = on_attach,
})
