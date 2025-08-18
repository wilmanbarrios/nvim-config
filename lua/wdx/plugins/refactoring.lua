return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        mode = "x",
        "<leader>rv",
        ":Refactor extract_var ",
      },
    },
  },

  {
    "phpactor/phpactor",
    ft = "php",
    branch = "master",
    build = "composer install --no-dev -o",
    enabled = false,
    keys = {
      { "<Leader>ki", ":PhpactorImportClass<CR>", desc = "Import class" },
      {
        "<Leader>kI",
        ":PhpactorClassExpand<CR><esc>",
        desc = "Expand inline class",
      },
      { "<Leader>rn", ":PhpactorMoveFile<CR>", desc = "Move class" },
      { "<Leader>cf", ":PhpactorCopyFile<CR>", desc = "Copy class" },
    },
  },
}
