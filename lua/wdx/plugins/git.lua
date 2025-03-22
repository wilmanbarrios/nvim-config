local utils = require("wdx.utils")

return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "GBrowse" },
    dependencies = {
      "tpope/vim-rhubarb",
    },
    keys = {
      { "<leader>gs", "<cmd>G<cr><C-w>o", desc = "Git status page" },
      { "<leader>gb", "<cmd>Git blame<CR>", desc = "Git blame page" },
      {
        mode = "x",
        "<leader>gy",
        ":GBrowse!<CR>",
        desc = "[G]it [Y]nk link for visual selection",
      },
      {
        "<leader>grf",
        function()
          vim.cmd("Git restore %")

          vim.notify(
            "File restored!",
            vim.log.levels.INFO,
            { annote = "vim-fugitive" }
          )
        end,
        desc = "[G]it [r]estore current [f]ile",
      },
      {
        mode = "n",
        "<leader>grb",
        function()
          local current_branch = utils.git_branch()
          if not string.len(current_branch) then
            vim.notify(
              "Could not find a git branch",
              vim.log.levels.WARN,
              { annote = "vim-fugitive" }
            )
            return nil
          end

          local ignored_branch = { "master", "main", "develop", "development" }
          if vim.tbl_contains(ignored_branch, current_branch) then
            vim.notify(
              string.format("The branch '%s' can't be renamed", current_branch),
              vim.log.levels.WARN,
              { annote = "vim-fugitive" }
            )
            return nil
          end

          vim.fn.feedkeys(string.format(":Git branch -m %s", current_branch))
        end,
        desc = "[g]it [r]ename [b]ranch current branch",
      },
      -- TODO: create a command that given a branch name will produce a well
      -- formatted branch name
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        -- Actions
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
        map("n", "<leader>hu", ":Gitsigns undo_state_hunk<CR>")
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
        map("n", "<leader>hd", ":Gitsigns preview_hunk<CR>")
        map("n", "<leader>hb", ":Gitsigns toggle_current_line_blame<CR>")
      end,
    },
  },
}
