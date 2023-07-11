" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END
