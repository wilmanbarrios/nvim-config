" trim white spaces before save
autocmd BufWritePre * :call TrimWhiteSpace()
function! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

augroup run_packer_compile_after_saving_plugins_file
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup END

augroup enable_spell
  autocmd!
  autocmd FileType gitcommit,markdown setlocal spell
augroup END
