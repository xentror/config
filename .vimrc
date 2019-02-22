set mouse=a
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=80
set relativenumber
set number
syntax on

map <F3> <esc>:q!<cr><esc>
imap <F3> <esc>:q!<cr><esc>i

map <F2> <esc>:wq!<cr><esc>
imap <F2> <esc>:wq!<cr><esc>

map <F1> <esc>:w!<cr><esc>
imap <F1> <esc>:w!<cr><esc>i

map <C-o> <esc>:Vexplore<cr><esc>
imap <C-o> <esc>:Vexplore<cr><esc>i

colorscheme pablo

set listchars=trail:$

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
