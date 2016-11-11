set nocompatible               " be iMproved
filetype off                   " required!

" Set classpath files for Java
" au BufNewFile,BufRead .classpath set filetype=java

set rtp+=$HOME/.vim/bundle/vundle
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vimwiki/vimwiki'
Plugin 'pprovost/vim-ps1'
Plugin 'tell-k/vim-autopep8'
Plugin 'Yggdroot/indentLine' " Show line indentation

call vundle#end()            " required
filetype plugin indent on    " required

inoremap jk <Esc>
set guioptions-=m
set guioptions-=T
set autoindent   "Always set auto-indenting on"
set expandtab    "Insert spaces instead of tabs in insert mode. Use spaces for indents"
set tabstop=4    "Number of spaces that a <Tab> in the file counts for"
set shiftwidth=4 "Number of spaces to use for each step of (auto)indent"
set keywordprg=perldoc\ -f

map <F2> <ESC>:NERDTreeToggle<RETURN>
map <F3> <ESC>:NERDTree c:\<RETURN>
map <F4> <ESC>:NERDTree c:\working<RETURN>
map <F5> <ESC>:NERDTree h:\<RETURN>

:au Filetype perl nmap <F6> :%!perltidy -b -bext='/' %<CR>
syntax enable
set background=light
colorscheme solarized

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers=['perl']
let g:syntastic_perl_lib_path = [ 'c:\sfms\lib' ]

let perl_include_pod   = 1    "include pod.vim syntax file with perl.vim"
let perl_extended_vars = 1    "highlight complex expressions such as @{[$x, $y]}"
let perl_sync_dist     = 250  "use more context for highlighting"

"folding settings"
set foldenable
"set foldmethod      = syntax
"set foldlevel_start  = 1
let perl_fold       = 1

map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l
map <leader>_ <C-W>_
map <leader>= <C-W>=

" Open a new buffer
map <leader>n <C-W>n
map <leader>v <C-W>v

" Moving
map <leader>H              :wincmd H<cr>
map <leader>K              :wincmd K<cr>
map <leader>L              :wincmd L<cr>
map <leader>J              :wincmd J<cr>

" resizing
nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>

" Shortcuts
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap ; :
"nnoremap : ;
nnoremap ,t <Esc>:tabnew<CR>

" Smart way to move between windows
" Session Settings
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" Ignore swap error messages
set shortmess+=A

" Set clipboard for windows
set clipboard=unnamed

" Toggle between relative and absolute numbers
function! NumberToggle()
  if((&relativenumber == 1) && (&number == 1))
    set nornu
    set nonu
  elseif((&relativenumber == 0) && (&number == 1))
    set rnu
  else
    set nu      
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" So you don't have to write when hiding a buffer
set hidden

" Settings for python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Fold settings for Python
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Flag unnecessary whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let python_highlight_all=1
" syntax on

filetype plugin indent on
