local function is_dotfiles()
  local cwd = vim.fn.getcwd()
  local dirs = vim.split(cwd, "/")
  return dirs[#dirs] == "dotfiles"
end

local function dotfiles_files()
  require("fzf-lua").git_files({
    cmd = "git -c core.quotepath=false ls-files --exclude-standard "
      .. "--cached --recurse-submodules :!:dotbot",
    cwd = vim.fn.expand("$DOTFILES"),
    prompt = "❯ ",
  })
end

return {
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   branch = "master",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope-ui-select.nvim",
  --     { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  --   },
  --   opts = function()
  --     local actions = require("telescope.actions")
  --     local themes = require("telescope.themes")
  --
  --     return {
  --       defaults = {
  --         prompt_prefix = " ",
  --         selection_caret = " ",
  --         dynamic_preview_title = true,
  --         mappings = {
  --           i = {
  --             ["<esc>"] = actions.close,
  --             ["<c-x>"] = false, -- default open file in split
  --             ["<c-s>"] = actions.select_horizontal, -- open file in split
  --             ["<c-q>"] = actions.send_to_qflist + actions.open_qflist,
  --           },
  --         },
  --       },
  --       extensions = {
  --         fzf = {
  --           fuzzy = true, -- false will only do exact matching
  --           override_generic_sorter = true, -- override the generic sorter
  --           override_file_sorter = true, -- override the file sorter
  --         },
  --         ["ui-select"] = {
  --           themes.get_ivy({
  --             layout_config = {
  --               height = 10,
  --             },
  --           }),
  --         },
  --       },
  --     }
  --   end,
  --   cmd = "Telescope",
  --   keys = {
  --     {
  --       "<Leader>p",
  --       function()
  --         local utils = require("telescope.utils")
  --         local git_command = utils.__git_command
  --         local cwd = vim.fn.getcwd()
  --         local dirs = vim.split(cwd, "/")
  --         local last_dir = dirs[#dirs]
  --         local is_dotfiles = last_dir == "dotfiles"
  --
  --         if is_dotfiles then
  --           require("telescope.builtin").git_files({
  --             git_command = git_command({
  --               "-c",
  --               "core.quotepath=false",
  --               "ls-files",
  --               "--exclude-standard",
  --               "--cached",
  --               "--recurse-submodules",
  --               ":!:dotbot",
  --             }),
  --             cwd = "$DOTFILES",
  --             prompt_title = "Dotfiles",
  --           })
  --         else
  --           require("telescope.builtin").find_files({
  --             find_command = {
  --               "fd",
  --               "--type",
  --               "f",
  --               "--strip-cwd-prefix",
  --               "-E",
  --               "dotbot",
  --             },
  --           })
  --         end
  --       end,
  --     },
  --     {
  --       "<Leader>b",
  --       function()
  --         require("telescope.builtin").buffers({
  --           ignore_current_buffer = true,
  --           previewer = false,
  --           sort_mru = true,
  --           sorting_strategy = "ascending",
  --           layout_config = {
  --             prompt_position = "top",
  --             width = 100,
  --             height = 20,
  --           },
  --         })
  --       end,
  --     },
  --     {
  --       "<Leader>fd",
  --       function()
  --         local utils = require("telescope.utils")
  --         local git_command = utils.__git_command
  --
  --         require("telescope.builtin").git_files({
  --           git_command = git_command({
  --             "-c",
  --             "core.quotepath=false",
  --             "ls-files",
  --             "--exclude-standard",
  --             "--cached",
  --             "--recurse-submodules",
  --             ":!:dotbot",
  --           }),
  --           cwd = "$DOTFILES",
  --           prompt_title = "Dotfiles",
  --         })
  --       end,
  --     },
  --     {
  --       "<Leader>ht",
  --       function()
  --         require("telescope.builtin").help_tags()
  --       end,
  --     },
  --     {
  --       "<Leader>sw",
  --       function()
  --         local text =
  --           vim.fn.input("Grep String 👉 ", vim.fn.expand("<cword>"))
  --
  --         if text == "" then
  --           return
  --         end
  --
  --         require("telescope.builtin").grep_string({
  --           path_display = { "shorten" },
  --           search = text,
  --         })
  --       end,
  --     },
  --     {
  --       "<Leader>sq",
  --       function()
  --         require("telescope.builtin").grep_string()
  --       end,
  --     },
  --     {
  --       "<Leader>grr",
  --       function()
  --         require("telescope.builtin").lsp_document_symbols()
  --       end,
  --     },
  --     {
  --       "<Leader>tt",
  --       function()
  --         require("telescope.builtin").resume()
  --       end,
  --     },
  --   },
  --   config = function(_, opts)
  --     require("telescope").setup(opts)
  --     require("telescope").load_extension("fzf")
  --     require("telescope").load_extension("ui-select")
  --   end,
  -- },

  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local actions = require("fzf-lua").actions

      return {
        -- "ivy",
        defaults = {
          cwd_header = false, -- hide cwd from results header
          cwd_prompt = false, -- hide cwd from prompt
        },
        files = {
          cwd_prompt = false,
          prompt = "❯ ",
        },
        keymap = {
          fzf = {
            ["esc"] = "abort",
          },
        },
        actions = {
          files = {
            ["enter"] = actions.file_edit_or_qf,
            ["ctrl-s"] = actions.file_split, -- open file in split
            ["ctrl-q"] = actions.file_sel_to_qf, -- send to qflist
          },
        },
      }
    end,
    keys = {
      {
        "<Leader>p",
        function()
          if is_dotfiles() then
            dotfiles_files()
          else
            require("fzf-lua").files({
              cmd = "fd --type f --strip-cwd-prefix -E dotbot",
            })
          end
        end,
      },
      {
        "<Leader>b",
        function()
          require("fzf-lua").buffers({
            ignore_current_buffer = true,
            sort_lastused = true,
            previewer = false,
            winopts = {
              height = 0.4,
              width = 0.5,
            },
          })
        end,
      },
      {
        "<Leader>fd",
        dotfiles_files,
      },
      {
        "<Leader>ht",
        function()
          require("fzf-lua").helptags()
        end,
      },
      {
        "<Leader>sw",
        function()
          local text =
            vim.fn.input("Grep String 👉 ", vim.fn.expand("<cword>"))

          if text == "" then
            return
          end

          require("fzf-lua").grep({ search = text })
        end,
      },
      {
        "<Leader>sq",
        function()
          require("fzf-lua").grep_cword()
        end,
      },
      {
        "<Leader>grr",
        function()
          require("fzf-lua").lsp_document_symbols()
        end,
      },
      {
        "<Leader>tt",
        function()
          require("fzf-lua").resume()
        end,
      },
    },
  },
}
