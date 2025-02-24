--- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    require("vim.highlight").on_yank()
  end,
})

-- TODO: describe
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  command = "wincmd =",
})

--- Workaround to fix folds when using telescope to open a file
---@see https://github.com/nvim-telescope/telescope.nvim/issues/559
local disabled_fts = { "gitcommit", "fugitive" }
vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
    if vim.tbl_contains(disabled_fts, vim.bo.filetype) then
      return
    end

    vim.api.nvim_create_autocmd("BufWinEnter", {
      once = true,
      command = "normal! zx | zR",
    })
  end,
})

local function get_current_branch()
  local branch =
    vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
  if branch ~= "" then
    return branch
  else
    return ""
  end
end

--- If we are creating a commit on a COOP repo and current branch is not
--- `develop` auto type for me the COOPFE issue code
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function(ev)
    local buf = ev.buf

    local project_code = os.getenv("PROJECT_CODE")
    local is_ignored =
      vim.tbl_contains({ "develop", "master", "main" }, get_current_branch())

    if project_code and not is_ignored then
      -- vim.api.nvim_feedkeys("4jf/wveeeyggPa: ", "n", true)
      vim.api.nvim_buf_set_lines(buf, 0, 0, false, project_code .. ":")
    end
  end,
})
