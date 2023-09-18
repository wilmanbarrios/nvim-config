vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
    -- TODO: improve this conditions
    if vim.bo.filetype == "gitcommit" then
      return
    end
    if vim.bo.filetype == "fugitive" then
      return
    end
    vim.api.nvim_create_autocmd("BufWinEnter", {
      once = true,
      command = "normal! zx | zR",
    })
  end,
})

-- TODO: explain
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function(ev)
    -- TODO: this needs to be done only if we have a pattern like this [A-Z]\+-[0-9]\+
    vim.api.nvim_feedkeys("4jf/wveeeyggPa: ", "n", true)
  end,
})
