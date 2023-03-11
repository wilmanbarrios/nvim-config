return {
  'nvim-telescope/telescope.nvim',
  version = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 
      'nvim-telescope/telescope-ui-select.nvim',
      config = function()
        require("telescope").load_extension("ui-select")
      end
    },
    { 
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      config = function()
        require("telescope").load_extension("fzf")
      end
    },
  },
  opts = function()
    local actions = require "telescope.actions"
    local themes = require "telescope.themes"

    return {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        dynamic_preview_title = true,
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<c-x>"] = false, -- default open file in split
            ["<c-s>"] = actions.select_horizontal, -- open file in split
            ["<c-q>"] = actions.send_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
        },
        ["ui-select"] = {
          themes.get_ivy {
            layout_config = {
              height = 10,
            },
          }
        },
      }
    }
  end,
  config = function(_, opts)
    require("telescope").setup(opts)
    require("wdx.telescope.mappings")
  end,
}
