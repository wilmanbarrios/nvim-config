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

    local text = issue_code .. ": "
    vim.api.nvim_buf_set_text(ev.buf, 0, 0, 0, 0, { text })
    vim.api.nvim_feedkeys("A", "n", true)
  end,
})
