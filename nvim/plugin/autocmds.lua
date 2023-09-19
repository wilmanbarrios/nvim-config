--- Workaround to fix folds when using telescope to open a file
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

--- If we are creating a commit on a COOP repo auto type for me the COOPFE issue code
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function(ev)
    if string.find(ev.file, "COOP") then
      vim.api.nvim_feedkeys("4jf/wveeeyggPa: ", "n", true)
    end
  end,
})
