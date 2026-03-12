require("wdx.lsp.diagnostic")

local keymap = vim.keymap.set

local lsp_node = os.getenv("LSP_NODE_PATH")
if lsp_node then
  vim.env.PATH = lsp_node .. ":" .. vim.env.PATH
end

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
  local bufopts = { buffer = bufnr, noremap = true }

  keymap("n", "gd", function()
    vim.lsp.buf.definition({
      on_list = function(options)
        vim.fn.setqflist({}, " ", options)
        vim.cmd.cfirst()
      end,
    })
  end, bufopts)
  keymap("n", "gD", vim.lsp.buf.implementation, bufopts)
  keymap("n", "grr", vim.lsp.buf.rename, bufopts)
  keymap("n", "dl", vim.diagnostic.open_float, bufopts)
  keymap("n", "<Leader>D", vim.lsp.buf.type_definition, bufopts)
  keymap("n", "<Leader>ca", vim.lsp.buf.code_action, bufopts)

  keymap(
    "n",
    "gO",
    -- "<cmd>vs | lua vim.lsp.buf.definition()<CR>",
    function()
      vim.cmd("vs")

      vim.lsp.buf.definition({
        on_list = function(options)
          vim.fn.setqflist({}, " ", options)
          vim.cmd.cfirst()
        end,
      })
    end,
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
  -- automatic_enable = {
  --   exclude = { "ts_ls", "biome" },
  -- },
})
require("mason-tool-installer").setup({
  ensure_installed = {
    "eslint",
    "lua_ls",
    "pyright",
    "ruff",
    "tailwindcss",
    "ts_ls",
    "biome",
    "prettier",
    "prettierd",
    "stylua",
    "tree-sitter-cli",
  },
  auto_update = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    on_attach(nil, args.buf)
  end,
})
