set nocompatible               " be iMproved
filetype off                   " required!
syntax enable

" gvim on Windows, nvim on Linux
if has("gui_win32")
    set rtp+=$HOME/.vim/bundle/vundle
else
    set rtp+=$HOME/.nvim/bundle/Vundle.vim
endif

call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
"Plugin 'tmhedberg/SimpylFold'
Plugin 'vimwiki/vimwiki'
Plugin 'pprovost/vim-ps1'
Plugin 'tell-k/vim-autopep8'
Plugin 'Yggdroot/indentLine' " Show line indentation
Plugin 'Chiel92/vim-autoformat' " Multi Language autoformat tool
Plugin 'python-mode/python-mode.git' " Suite of tools to support python development
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'roryokane/detectindent' " Automatically detect and set indentation

if has("gui_win32")
    " Place Windows specific plugins here
    Plugin 'davidhalter/jedi-vim.git' " Needs python35 32 bit installed
else
    Plugin 'christoomey/vim-tmux-navigator' " tmux integration
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'zchee/deoplete-jedi'
    Plugin 'hkupty/iron.nvim'

    " Enable Deoplete
    let g:deoplete#enable_at_startup = 1

    " deoplete tab-complete
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"

    " <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

    " Iron movement mappings
    :tnoremap <C-h> <C-\><C-N><C-w>h
    :tnoremap <C-j> <C-\><C-N><C-w>j
    :tnoremap <C-k> <C-\><C-N><C-w>k
    :tnoremap <C-l> <C-\><C-N><C-w>l

endif

call vundle#end()            " required
filetype plugin indent on    " required

""" General settings
set autoindent   "Always set auto-indenting on"
set expandtab    "Insert spaces instead of tabs in insert mode. Use spaces for indents"
set tabstop=4    "Number of spaces that a <Tab> in the file counts for"
set shiftwidth=4 "Number of spaces to use for each step of (auto)indent"
set foldenable
set hidden " So you don't have to write when hiding a buffer
set shortmess+=A " Ignore swap error messages

""" General Key bindings
inoremap jk <Esc>
map <F2> <ESC>:NERDTreeToggle<RETURN>
nnoremap <F6> :Autoformat<CR>

" Open a new buffer
map <leader>n <C-W>n
map <leader>v <C-W>v

" Shortcuts
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap ; :
nnoremap ,t <Esc>:tabnew<CR>


""" Movement tweaks

if has("gui_win32")
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l
endif

map <leader>_ <C-W>_
map <leader>= <C-W>=

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

" Solarized
colorscheme solarized

""" Windows GUI settings
if has("gui_win32")
    map <F3> <ESC>:NERDTree h:\<RETURN>
    set background=light
    set guioptions-=m " Removes unneeded menu's
    set guioptions-=T
    set clipboard=unnamed " Set clipboard for windows
else

    set background=dark

    " Special settings for tmux
    if exists('$TMUX')
        "set termguicolors " Setting this fixes powerline but breaks colorscheme
        let g:airline_powerline_fonts = 1 " Setting to 1 breaks colorscheme in python
    endif

    " Settings for airline
    set t_Co=256
    set clipboard+=unnamedplus " Set clipboard for windows
    let airline_solarized_bg = 'dark'
    let g:airline_theme= 'solarized'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
    "let g:airline_symbols.linenr = '␊'
    "let g:airline_symbols.linenr = '␤'
    "let g:airline_symbols.linenr = '¶'
    "let g:airline_symbols.paste = 'ρ'
    "let g:airline_symbols.paste = 'Þ'
    "let g:airline_symbols.paste = '∥'
    "let g:airline_symbols.whitespace = 'Ξ'

    " airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
endif

" setting for CtrlP
let g:ctrlp_cmd = 'CtrlPBuffer'

""" Perl specific settings
:au Filetype perl nmap <F6> :%!perltidy -b -bext='/' %<CR>

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers=['perl']
"let g:syntastic_perl_lib_path = [ 'put additional perl libraries here' ]
let perl_include_pod   = 1    "include pod.vim syntax file with perl.vim"
let perl_extended_vars = 1    "highlight complex expressions such as @{[$x, $y]}"
let perl_sync_dist     = 250  "use more context for highlighting"
let perl_fold       = 1

""" Settings for python

let g:python_host_prog = '/home/ian/miniconda2/envs/vpython2/bin/python'
let g:python3_host_prog = '/home/ian/miniconda2/envs/nvimpy/bin/python'

autocmd FileType python map <buffer> <F3> : call Flake8()<CR>

au BufNewFile,BufRead *.py
    \ set textwidth=99 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |


" Enable indentation autodetect
let g:detectindent_autodetect = 1

" Fold settings for Python
" Currently Disabled. Not sure if it works with nvim
"autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinEnter *.py setlocal foldmethod=indent foldnestmax=2
"autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

let python_highlight_all=1

" Python-mode plugin settings

let g:pymode = 1 " Turn on/off

let g:pymode_rope = 0 " Use deoplete

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 0

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" Disable syntax highlighting (using Syntastic)
let g:pymode_syntax = 0
let g:pymode_syntax_all = 0
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Autofold code with pymode
let g:pymode_folding = 0

" Flag unnecessary whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

""" Java Settings
" au BufNewFile,BufRead .classpath set filetype=java

""" Protobuf syntax
augroup filetype
    au! BufRead,BufNewFile *.proto* setfiletype proto
augroup end

""" Session Settings
let g:session_autosave = 'no'
let g:session_autoload = 'no'

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

