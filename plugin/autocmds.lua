--- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.hl.hl_op()
  end,
})

-- Keep splits even when resizing tmux
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  command = "wincmd =",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function(ev)
    local utils = require("wdx.utils")

    local branch = utils.git_branch()
    local issue_code = string.match(branch, "([A-Z]+-%d+)")
    if not issue_code then
      vim.cmd("startinsert")
      return
    end

    -- Only prefix a blank subject line; a commit template, amend, or
    -- --verbose buffer already has content on line 0 and must be left alone.
    if vim.api.nvim_buf_get_lines(ev.buf, 0, 1, false)[1] ~= "" then
      vim.cmd("startinsert")
      return
    end

    local text = issue_code .. ": "
    vim.api.nvim_buf_set_text(ev.buf, 0, 0, 0, 0, { text })
    vim.api.nvim_win_set_cursor(0, { 1, #text })
    vim.cmd("startinsert!")
  end,
})
