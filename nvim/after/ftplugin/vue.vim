setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

augroup Format
  autocmd! * <buffer>
  autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
augroup END
