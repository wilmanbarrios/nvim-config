local themes = require("telescope.themes")
local utils = require("telescope.utils")
local git_command = utils.__git_command

local M = {}

function M.find_in_dotfiles()
  require("telescope.builtin").git_files({
    git_command = git_command({
      "-c",
      "core.quotepath=false",
      "ls-files",
      "--exclude-standard",
      "--cached",
      "--recurse-submodules",
      ":!:dotbot",
    }),
    cwd = "$DOTFILES",
    prompt_title = "Dotfiles",
  })
end

function M.find_files()
  local cwd = vim.fn.getcwd()
  local dirs = vim.split(cwd, "/")
  local last_dir = dirs[#dirs]
  local is_dotfiles = last_dir == "dotfiles"

  if is_dotfiles then
    M.find_in_dotfiles()
  else
    require("telescope.builtin").find_files({
      find_command = {
        "fd",
        "--type",
        "f",
        "--strip-cwd-prefix",
        "-E",
        "dotbot",
      },
    })
  end
end

function M.find_in_vendors()
  require("telescope.builtin").find_files({
    prompt_title = "Find in vendor",
    layout_config = {
      prompt_position = "top",
    },
    search_dirs = { "vendor" },
    sorting_strategy = "ascending",
  })
end

function M.buffers()
  require("telescope.builtin").buffers({
    ignore_current_buffer = true,
    previewer = false,
    sort_mru = true,
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
      width = 100,
      height = 20,
    },
  })
end

function M.lsp_code_actions()
  require("telescope.builtin").lsp_code_actions(themes.get_ivy({
    layout_config = {
      height = 10,
    },
  }))
end

function M.grep_prompt()
  local text = vim.fn.input("Grep String > ", vim.fn.expand("<cword>"))

  if text == "" then
    print("aborted...")
    return
  end

  require("telescope.builtin").grep_string({
    path_display = { "shorten" },
    search = text,
  })
end

return setmetatable({}, {
  __index = function(_, k)
    if M[k] then
      return M[k]
    else
      return require("telescope.builtin")[k]
    end
  end,
})
