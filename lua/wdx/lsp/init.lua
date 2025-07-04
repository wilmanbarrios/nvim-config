require("wdx.lsp.diagnostic")

local keymap = vim.keymap.set

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
  local bufopts = { buffer = bufnr, noremap = true }

  -- Builtin LSP
  keymap("n", "gD", vim.lsp.buf.implementation, bufopts)
  keymap("i", "<c-k>", function()
    vim.lsp.buf.signature_help({ border = "rounded" })
  end, bufopts)
  keymap("n", "K", function()
    vim.lsp.buf.hover({ border = "rounded" })
  end, bufopts)
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
  -- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
  keymap("n", "grr", "<cmd>Lspsaga rename mode=n<CR>", bufopts)
end

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_enable = {
    exclude = { "ts_ls" },
  },
  ensure_installed = {
    "eslint",
    "lua_ls",
    "pyright",
    "ruff",
    "tailwindcss",
    "ts_ls",
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
    vim.o.foldlevelstart = 99
    vim.o.foldenable = false
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

    vim.keymap.del("n", "K", { buffer = args.buf })

    on_attach(nil, args.buf)
  end,
})
