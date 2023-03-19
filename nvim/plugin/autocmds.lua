vim.api.nvim_create_autocmd('BufRead', {
  callback = function()
    if vim.bo.filetype == 'gitcommit' then
      return
    end
    vim.api.nvim_create_autocmd('BufWinEnter', {
      once = true,
      command = 'normal! zx | zR'
    })
  end
})
