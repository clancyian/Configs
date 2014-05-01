set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=$HOME/vimfiles/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'

inoremap jk <Esc>
set guioptions-=m
set guioptions-=T
set autoindent   "Always set auto-indenting on"
set expandtab    "Insert spaces instead of tabs in insert mode. Use spaces for indents"
set tabstop=4    "Number of spaces that a <Tab> in the file counts for"
set shiftwidth=4 "Number of spaces to use for each step of (auto)indent"
set keywordprg=perldoc\ -f
map <F2> <ESC>:NERDTreeToggle<RETURN>
map <F3> <ESC>:NERDTree c:\working<RETURN>
map <F4> <ESC>:NERDTree c:\<RETURN>
map <F5> <ESC>:NERDTree h:\<RETURN>
:au Filetype perl nmap <F6> :%!perltidy -b -bext='/' %<CR>
syntax enable
set background=light
colorscheme solarized

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers=['perl']

let perl_include_pod   = 1    "include pod.vim syntax file with perl.vim"
let perl_extended_vars = 1    "highlight complex expressions such as @{[$x, $y]}"
let perl_sync_dist     = 250  "use more context for highlighting"

"folding settings"
set foldenable
"set foldmethod      = syntax
"set foldlevel_start  = 1
let perl_fold       = 1

nnoremap ; :
"nnoremap : ;

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

filetype plugin indent on
