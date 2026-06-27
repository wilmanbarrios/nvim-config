local M = {}

function M.git_branch()
  if vim.g.loaded_fugitive then
    return vim.fn.FugitiveHead()
  end

  local branch =
    vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
  if branch ~= "" then
    return branch
  else
    return ""
  end
end

--- Commentstring at the cursor, resolved via treesitter context.
--- Single source for the ts_context_commentstring coupling.
---@return string|nil
function M.commentstring()
  return require("ts_context_commentstring").calculate_commentstring()
end

--- Filetypes served by the installed treesitter parsers.
--- Parser/language names are not always equal to filetypes (e.g. `bash`
--- serves `sh`), so map each installed parser to its real filetypes.
---@return string[]
function M.installed_ts_filetypes()
  local installed = require("nvim-treesitter.config").get_installed("parsers")

  local filetypes = {}
  for _, lang in ipairs(installed) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      filetypes[#filetypes + 1] = ft
    end
  end

  return filetypes
end

return M
