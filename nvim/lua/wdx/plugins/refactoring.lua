return {
   {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    keys = {
      { "<leader>rc", ":lua require('refactoring').debug.print_var({ below = false })<CR>" },
      { mode = 'v', "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]] },
      { mode = 'v', "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]] },
      { mode = 'v', "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]] },
      { mode = 'v', "<leader>rc", ":lua require('refactoring').debug.print_var({ normal = true, below = false })<CR>" },
    }
  },

  {
    'phpactor/phpactor',
    ft = 'php',
    branch = 'master',
    build = 'composer install --no-dev -o',
    enabled = false,
    keys = {
      { "<Leader>ki", ':PhpactorImportClass<CR>', desc = 'Import class' },
      { "<Leader>kI", ':PhpactorClassExpand<CR><esc>', desc = 'Expand inline class' },
      { "<Leader>rn", ':PhpactorMoveFile<CR>', desc = 'Move class' },
      { "<Leader>cf", ':PhpactorCopyFile<CR>', desc = 'Copy class' },
    }
  },
}
