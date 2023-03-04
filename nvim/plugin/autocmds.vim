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

" TODO: create autocmd that will automatically run `./install` when files are created/deleted under `nvim` directory
" this can be achieved using :h nvim-tree.api.events
