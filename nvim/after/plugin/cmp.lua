local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require('lspkind')

cmp.setup {
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end
  },

  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
    -- border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
  },

  completion = {
    completeopt = 'menu,menuone,noinsert',
  },

  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    }),
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    -- { name = 'buffer', keyword_length = 5 },
    { name = 'path' },
  },

  experimental = {
    ghost_text = false,
  }
}

-- If you want insert `(` after select function or method item
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done())
