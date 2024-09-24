setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal textwidth=120

" noremap <buffer> <Leader>ki :PhpactorImportClass<CR>
" noremap <buffer> <Leader>kI :PhpactorClassExpand<CR><esc>
" noremap <buffer> <Leader>ka :PhpactorImportMissingClasses<CR>
" noremap <buffer> <Leader>rn :PhpactorMoveFile<CR>
" noremap <buffer> <Leader>cf :PhpactorCopyFile<CR>

" nnoremap <silent><Leader>pcf :silent! !php-cs-fixer fix %<CR>

" imap ;; <Esc>A;<Esc>
" imap ,, <Esc>A,<Esc>

augroup Format
  autocmd! * <buffer>
  autocmd BufWritePre  <buffer> lua vim.lsp.buf.format()
  " autocmd BufWritePost <buffer> silent! !php-cs-fixer fix %
  " autocmd BufWritePost <buffer> edit
  " autocmd BufWritePost <buffer> redraw!
augroup END
