let g:VimuxHeight = '40'
let g:VimuxOrientation = 'h'

let test#neovim#term_position = "vert botright 98"

let test#strategy = "vimux"

let test#php#dusk#executable = "php artisan dusk --pest"

" run tests
nmap <silent> <Leader>tr :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile <CR>
nmap <silent> <Leader>ts :TestSuite --stop-on-failure<CR>
nmap <silent> <Leader>tp :TestLast<CR>
