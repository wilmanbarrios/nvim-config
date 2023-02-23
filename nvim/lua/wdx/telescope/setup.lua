local actions = require "telescope.actions"
local themes = require "telescope.themes"

require("telescope").setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    dynamic_preview_title = true,
    -- path_display = { "smart" },
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
      override_generic_sorter = true, -- override the generic sorter
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

require("telescope").load_extension "fzf"
require("telescope").load_extension("ui-select")
