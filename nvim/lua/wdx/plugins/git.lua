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
      { '<leader>gy', "<cmd>'<'>GBrowse!<CR>", desc = 'Get a link for currently highlighted region' },
    }
  },
  {
    'lewis6991/gitsigns.nvim',
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
        map('n', '<leader>hd', ':Gitsigns toggle_current_line_blame<CR>')
        -- map('n', '<leader>hS', gs.stage_buffer)
        -- map('n', '<leader>hR', gs.reset_buffer)
        -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        map('n', '<leader>hd', ':Gitsigns toggle_current_line_blame<CR>')
        -- map('n', '<leader>hd', gs.diffthis)
        -- map('n', '<leader>hD', function() gs.diffthis('~') end)
        -- map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    }
  },
}
