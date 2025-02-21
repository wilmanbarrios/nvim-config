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
    -- TODO(wilman): I should include a ENV variable into each repo to get the
    -- Jira project code, to avoid doing this on each project
    local is_coop_repo = string.find(ev.file, "COOP")
    local is_orbit_repo = string.find(ev.file, "Orbit")
    local is_target = is_coop_repo or is_orbit_repo

    local ignore_branchs = { "develop", "master", "main" }
    local is_ignored = vim.tbl_contains(ignore_branchs, get_current_branch())

    if is_target and not is_ignored then
      vim.api.nvim_feedkeys("4jf/wveeeyggPa: ", "n", true)
    end
  end,
})
