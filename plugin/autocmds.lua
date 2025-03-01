--- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.hl.on_yank()
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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function(ev)
    local branch = get_current_branch()
    local issue_code = string.match(branch, "([A-Z]+-%d+)")
    if not issue_code then
      return
    end

    local text = issue_code .. ": "
    vim.api.nvim_buf_set_text(ev.buf, 0, 0, 0, 0, { text })
    vim.api.nvim_feedkeys("A", "n", true)
  end,
})
