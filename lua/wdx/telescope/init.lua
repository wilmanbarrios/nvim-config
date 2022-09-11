SHOULD_RELOAD_TELESCOPE = true

local reloader = function()
  if SHOULD_RELOAD_TELESCOPE then
    RELOAD "plenary"
    RELOAD "telescope"
    RELOAD "wdx.telescope.setup"
    RELOAD "nvim-web-devicons"
  end
end

local themes = require "telescope.themes"

local M = {}

function M.find_in_dotfiles()
  require"telescope.builtin".git_files({
    cwd = "$DOTFILES",
    prompt_title = "Dotfiles",
  })
end

function M.find_files()
  local cwd = vim.fn.getcwd()
  local dirs = vim.split(cwd, '/')
  local last_dir = dirs[#dirs]
  local is_dotfiles = last_dir == "dotfiles"

  if is_dotfiles then
    M.find_in_dotfiles()
  else
    require"telescope.builtin".find_files {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "-E", "dotbot" },
    }
  end
end

function M.find_in_vendors()
  require"telescope.builtin".find_files {
    prompt_title = "Find in vendor",
    layout_config = {
      prompt_position = "top",
    },
    search_dirs = { "vendor" },
    sorting_strategy = "ascending",
  }
end

function M.buffers()
  require"telescope.builtin".buffers(themes.get_dropdown({
    ignore_current_buffer = true,
    previewer = false,
    sort_mru = true,
    layout_config = {
      width = 100,
      height = 20,
    },
  }))
end

function M.lsp_code_actions()
  require"telescope.builtin".lsp_code_actions(themes.get_ivy({
    layout_config = {
      height = 10,
    },
  }))
end

function M.grep_prompt()
  local text = vim.fn.input("Grep String > ", vim.fn.expand "<cword>")

  if text == "" then
    print("aborted...")
    return
  end

  require("telescope.builtin").grep_string {
    path_display = { "shorten" },
    search = text,
  }
end

function M.get_document_symbols()
  local symbols = {}

  if vim.bo.filetype == 'php' then
    table.insert(symbols, "method")
  elseif vim.bo.filetype == 'javascript' or vim.bo.filetype == 'typescriptreact' then
    table.insert(symbols, "function")
  end

  require"telescope.builtin".lsp_document_symbols({
    symbols = symbols,
  })
end

return setmetatable({}, {
  __index = function(_, k)
    reloader()

    if M[k] then
      return M[k]
    else
      return require("telescope.builtin")[k]
    end
  end,
})
