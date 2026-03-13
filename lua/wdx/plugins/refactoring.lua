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

}
