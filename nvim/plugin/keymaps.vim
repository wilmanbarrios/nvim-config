" save file only when we have changes to save
nmap <Leader>w :up<CR>

" quit file
nmap <Leader>q :q<CR>

" ease splits navigations
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

" disable hlsearch
nmap <Leader><Space> :nohls<CR>

" when nagivating backward/forward center cursor
nnoremap <silent> <C-O> <C-O>zz
nnoremap <silent> <C-I> <C-I>zz

" TODO: highlight word under the cursor
" vim.fn.expand("<cword>")
" how to pass
nnoremap <Leader>hw :/expand('<cword>')

" show highlight group under cursor
nmap <Leader>hg :Inspect<CR>
nmap <Leader>hp :InspectTree<CR>

" move lines up/down in visual mode
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

" join visual selected lines
vmap <Leader>j :j<CR>

vnoremap <Leader>y "+y
nnoremap <Leader>y "+y

" inoremap ;; <esc>A;<esc>
" inoremap ,, <esc>A,<esc>

