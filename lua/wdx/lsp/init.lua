require("wdx.lsp.diagnostic")

local keymap = vim.keymap.set

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
  local bufopts = { buffer = bufnr, noremap = true }

  keymap("n", "gd", vim.lsp.buf.definition, bufopts)
  keymap("n", "gD", vim.lsp.buf.implementation, bufopts)
  keymap("n", "grr", vim.lsp.buf.rename, bufopts)
  keymap("n", "<Leader>D", vim.lsp.buf.type_definition, bufopts)
  keymap("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)

  keymap(
    "n",
    "gO",
    "<cmd>vs | lua vim.lsp.buf.definition()<CR>",
    vim.tbl_extend("force", bufopts, {
      desc = "Goto definition in a vsplit window",
    })
  )

  keymap("i", "<c-k>", function()
    vim.lsp.buf.signature_help({ border = "rounded" })
  end, bufopts)

  keymap("n", "K", function()
    vim.lsp.buf.hover({ border = "rounded" })
  end, bufopts)
end

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_enable = {
    exclude = { "ts_ls", "biome" },
  },
})
require("mason-tool-installer").setup({
  ensure_installed = {
    "eslint",
    "lua_ls",
    "pyright",
    "ruff",
    "tailwindcss",
    "ts_ls",
    { "biome", version = "1.9.5-nightly.81fdedb" },
    "prettier",
    "prettierd",
    "stylua",
    "tree-sitter-cli",
  },
})

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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    on_attach(nil, args.buf)
  end,
})
