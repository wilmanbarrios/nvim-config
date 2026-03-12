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

      -- local ok = ts.install("unstable")
      -- if not ok then
      --   vim.notify(
      --     "TS parsers installation was not successful.",
      --     vim.log.levels.WARN
      --   )
      --   return
      -- end

      local installed = require("nvim-treesitter.config").get_installed()

      vim.api.nvim_create_autocmd("FileType", {
        pattern = installed,
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
    event = "InsertEnter",
    opts = {
      context_commentstring = {
        enable = false,
      },
    },
    main = "ts_context_commentstring",
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
}
