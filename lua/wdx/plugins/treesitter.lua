return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = require("wdx.utils").installed_ts_filetypes(),
        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

          vim.treesitter.start()
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    main = "treesitter-context",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      enable = true,
    },
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    main = "ts_context_commentstring",
    event = "InsertEnter",
    opts = {
      enable_autocmd = false,
    },
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
