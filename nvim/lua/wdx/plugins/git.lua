return {
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G', 'GBrowse' },
    dependencies = {
      'tpope/vim-rhubarb',
    },
    keys = {
      { '<leader>gs', '<cmd>G<cr><C-w>o', desc = 'Git status page' },
      { '<leader>gb', "<cmd>Git blame<CR>", desc = 'Git blame page' },
      { mode = 'v', '<leader>gy', ":GBrowse!<CR>", desc = 'Get a link for currently highlighted region' },
    }
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    opts =  {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        -- Actions
        map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map('n', '<leader>hu', ':Gitsigns undo_state_hunk<CR>')
        map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hd', ':Gitsigns preview_hunk<CR>')
        map('n', '<leader>hb', ':Gitsigns toggle_current_line_blame<CR>')
      end
    }
  },
}
