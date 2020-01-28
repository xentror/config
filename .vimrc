" {{{ Various options

filetype plugin on
filetype plugin indent on

syntax on
set number
set colorcolumn=80
set encoding=utf-8
set nocompatible
set backspace=indent,eol,start

set incsearch
set hlsearch

set autoindent
set hidden
set listchars=eol:\ ,tab:>-,trail:-,extends:>,precedes:<,nbsp:¤
set list

set ruler
set modeline
set modelines=5
set foldmethod=marker
set lazyredraw

set report=0
set laststatus=2
set foldmethod=marker
set wildmenu

set complete-=i "improve vim native autocomplete

set display+=lastline "for super long line see something instead of '@'
set formatoptions+=j "remove comment char when joining 2 lines

" Restore cursor position
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Syntax highlighting for javascript template files
au BufNewFile,BufRead *.html set syntax=jst

" Undo and tags
set cpoptions-=C
set tags=tags;/,.tags;/,TAG;/
if version >= 703
    set undofile                          " to activate undofile feature
    set undodir=~/.cache/vim/undo,.       " to store undo files in same a specific dir
    au BufWritePre tmp* setl noundofile   " to ignore file into /tmp
endif

" Compilation
set makeprg=LC_ALL=C\ make\ MONOCHROME=1
set grepprg=git\ grep\ -H\ -n

" Patch errorformat to properly catch filenames in Z output
set errorformat^=:%*[\ ]%f:%l:\ %m

" Code formatting
set tabstop=4
set softtabstop=4
set expandtab
set textwidth=0
set shiftwidth=4

set cinoptions=
set cinoptions+=L0.5s          " align labels at 0.5 shiftwidth
set cinoptions+=:0.5s,=0.5s    " same for case labels and code following labels
set cinoptions+=g0.5s,h0.5s    " same for C++ stuff
set cinoptions+=t0             " type on the line before the function is not indented
set cinoptions+=(0,Ws          " indent in functions ( ... ) when it breaks
set cinoptions+=m1             " align the closing ) properly
set cinoptions+=j1             " java/javascript -> fixes blocks
set cinoptions+=l0.5s          " align code after label ignoring braces.

" Doxygen
au! Syntax {cpp,c,d,javascript}
au Syntax {cpp,c,d,javascript} runtime syntax/doxygen.vim
let g:doxygen_end_punctuation='[.?!]'

" {{{ Mapping

" change directory to the file being edited
nnoremap ,cd :cd %:p:h<CR>

" forbid non-breakable spaces
imap   <Space>

" next compilation error
map +        :cnext<cr>
map <kPlus>  :cnext<CR>
" previous compilation error
map -        :cprev<cr>
map <kMinus> :cprev<CR>
" next syntastic error
map <S-Right> :lnext<cr>
" previous syntastic error
map <S-Left> :lprev<cr>

" follow tag
map <F2> <C-]>

" bufExplorer
map <F3> <Leader>bt

" grep on the current word
map <F4> :gr! -w <cword><cr>

set pastetoggle=<F5>

nnoremap <F6> :nohlsearch<CR>

" spell check
map <F8> :setlocal spell! spelllang=en_us<CR>

" horizontal split + next buffer
map <F9> :split<cr>:bn<cr>
" vertical split + next buffer
map <F10> :vsplit<cr>:bn<cr>

" make
noremap  <F11> :make!<cr><cr>
inoremap <F11> <esc>:make!<cr><cr>

" remove trailing spaces
map <F12> mcHmh:%s/ \+$//ge<cr>'hzt`c

" move to left buffer
map  <C-Left>   <C-w><Left>
map! <C-Left>   <Esc> <C-w><Left>
" move to right buffer
map  <C-Right>  <C-w><Right>
map! <C-Right>  <Esc> <C-w><Right>
" move to buffer above
map  <C-Up>     <C-w><Up>
map! <C-Up>     <Esc> <C-w><Up>
" move to buffer below
map  <C-Down>   <C-w><Down>
map! <C-Down>   <Esc> <C-w><Down>

" scroll up
map <S-Up> <C-Y>
" scroll down
map <S-Down> <C-E>

" }}}

" Overlength
if version >= 703
    set cc=+1
    hi ColorColumn cterm=none ctermfg=none ctermbg=darkgray
else
    au FileType c,cpp match OverLength /\%79v.\+/
    hi OverLength cterm=none ctermfg=none ctermbg=darkblue
endif

" man plugin
runtime! ftplugin/man.vim      " to get pretty :Man
nmap K :Man <C-R>=expand("<cword>")<CR><CR>

" let :E :Explore (syntastic defines an Errors command which makes :E
" ambiguous)
command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>

" {{{ Colors

hi Comment      cterm=none       ctermfg=blue       ctermbg=none
hi doxygenBrief cterm=none       ctermfg=cyan  ctermbg=none
hi Folded       cterm=none       ctermfg=brown      ctermbg=none

hi Visual       cterm=reverse    ctermfg=none       ctermbg=none
hi IncSearch    cterm=none       ctermfg=red        ctermbg=none
hi Search       cterm=underline  ctermfg=red        ctermbg=none

hi StatusLine   cterm=none       ctermfg=white      ctermbg=blue
hi StatusLineNc cterm=none       ctermfg=black      ctermbg=white
hi WildMenu     cterm=none       ctermfg=white      ctermbg=none
hi VertSplit    cterm=none       ctermfg=darkgray   ctermbg=none
hi NonText      cterm=none       ctermfg=darkgray   ctermbg=none

hi MatchParen   cterm=underline  ctermfg=none       ctermbg=none
hi Pmenu        cterm=none       ctermfg=gray       ctermbg=black
hi PmenuSel     cterm=none       ctermfg=black      ctermbg=gray
hi PmenuSbar    cterm=none       ctermfg=blue       ctermbg=blue
hi PmenuThumb   cterm=none       ctermfg=gray       ctermbg=gray

hi SpellBad     cterm=underline  ctermfg=lightred   ctermbg=none
hi SpellCap     cterm=none       ctermfg=lightred   ctermbg=none
hi SpellLocal   cterm=underline  ctermfg=darkgreen  ctermbg=none
hi SpellRare    cterm=none       ctermfg=none       ctermbg=none

hi javaScriptTpl       cterm=none ctermfg=darkgreen ctermbg=none
hi javaScriptTplMark   cterm=none ctermfg=magenta ctermbg=none

" Diff colors
hi DiffAdd      cterm=none         ctermfg=NONE     ctermbg=22
hi DiffDelete   cterm=none         ctermfg=52       ctermbg=52
hi DiffChange   cterm=none         ctermfg=NONE     ctermbg=17
hi DiffText     cterm=none         ctermfg=NONE     ctermbg=22

hi diffRemoved  cterm=none         ctermfg=red      ctermbg=none
hi diffAdded    cterm=none         ctermfg=green    ctermbg=none

hi link diffLine    SpecialChar
hi link diffSubname Comment

hi link diffOldFile diffRemoved
hi link diffNewFile diffAdded
hi link diffFile Statement

" }}}

" tmux specific settings
if &term =~ '^screen'
    " make the ctrl/shift based key bindings work in tmux;
    " this is needed in your ~/.tmux.conf: set-window-option -g xterm-keys on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

map <C-K> :pyf /srv/tools/share/dotfiles/vim/clang-format.py<cr>
imap <C-K> <c-o>:pyf /srv/tools/share/dotfiles/vim/clang-format.py<cr>

" ASCII doc folding
function! AsciidocLevel()
    if getline(v:lnum) =~ '^== .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^=== .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^==== .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^===== .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^====== .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^======= .*$'
        return ">6"
    endif
    return "="
endfunction
au BufRead,BufNewFile *.adoc setlocal foldexpr=AsciidocLevel()
au BufRead,BufNewFile *.adoc setlocal foldmethod=expr

"See lines around cursor
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

"Smarter matching for '%'
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

"Handle copy from/to x11 buffer
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" }}}
" {{{ Plugins
" {{{ vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/a.vim' " :A to switch decl/def files
Plug 'tpope/vim-fugitive' "commands git :Gtruc
Plug 'SirVer/ultisnips' "snippets
Plug 'jlanzarotta/bufexplorer' " explore the buffer with <F3>
Plug 'leafgarland/typescript-vim' "typescript
Plug 'vim-airline/vim-airline' "footer bar
Plug 'ervandew/supertab'
Plug 'embear/vim-localvimrc' "dep local_vimrc
Plug 'w0rp/ale' "async linting
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "find files
Plug 'junegunn/fzf.vim'

if !empty(glob("$HOME/.vimrc_myplugins"))
    source $HOME/.vimrc_myplugins
endif

call plug#end()

" }}}
" {{{ UltiSnips

let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsListSnippets        = "<F2>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

let g:UltiSnipsEditSplit = 'vertical'

" }}}
" {{{ a.vim

let g:alternateRelativeFiles   = 1
let g:alternateExtensions_blk  = "h"
let g:alternateExtensions_blkk = "h"
let g:alternateExtensions_h    = "c,cpp,cxx,cc,CC,blk,blkk"

" }}}
" {{{ Local vimrc

let g:localvimrc_name = ['.lvimrc', '.local_vimrc.vim']
let g:localvimrc_persistent = 2
let g:localvimrc_event = [ "BufWinEnter", "BufRead" ]

" disable sandboxing (the option makeprg that we set in waf localvimrcs cannot
" be set in a sandbox)
let g:localvimrc_sandbox = 0

" Whitelist ~/dev, which must contains all our repositories
let g:localvimrc_whitelist = $HOME.'/dev/'

" }}}
" {{{ Ale

let g:ale_open_list = 1
let g:ale_linters = {
    \   'c': ['clang'],
    \   'javascript': ['eslint'],
    \}
let g:airline#extensions#ale#enabled = 1
let g:ale_set_balloons = 0

highlight link ALEWarningSign String
highlight link ALEErrorSign Title

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" }}}
" {{{ fzf

" remap Ctrl-p on files referenced by Git
nmap <C-p> :GFiles<CR>

" }}}
" }}}
