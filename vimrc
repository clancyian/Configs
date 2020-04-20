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
Plugin 'Xuyuanp/nerdtree-git-plugin' " Git Icons for NERDTree
"Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'vim-scripts/indentpython.vim'
" Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
" Plugin 'vimwiki/vimwiki'
" Plugin 'pprovost/vim-ps1' " Powershell plugin
" Plugin 'tell-k/vim-autopep8'
" Plugin 'Yggdroot/indentLine' " Show line indentation
Plugin 'Chiel92/vim-autoformat' " Multi Language autoformat tool
Plugin 'python-mode/python-mode.git' " Suite of tools to support python development
" Plugin 'ludovicchabant/vim-gutentags'
Plugin 'roryokane/detectindent' " Automatically detect and set indentation
Plugin 'machakann/vim-highlightedyank' " Automatically detect and set indentation
" Plugin 'donRaphaco/neotex' " Compile latex files async
" Plugin 'lervag/vimtex' " for Latex
Plugin 'christoomey/vim-tmux-navigator' " tmux integration
Plugin 'Shougo/deoplete.nvim' " autocompletion
Plugin 'zchee/deoplete-jedi'
Plugin 'wellle/tmux-complete.vim' " autocompletion for words visible in tmux
" Plugin 'hkupty/iron.nvim' "  REPL
Plugin 'w0rp/ale'

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

set inccommand=nosplit " preview substutute live
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

" Moving windows about
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

set background=dark

" Special settings for tmux
if exists('$TMUX')
    "set termguicolors " Setting this fixes powerline but breaks colorscheme
    let g:airline_powerline_fonts = 1 " Setting to 1 breaks colorscheme in python
endif

" Enable true color
"if exists('+termguicolors')
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" set termguicolors
"ndif

" Settings for airline
set t_Co=256
set clipboard+=unnamedplus " Set clipboard for windows
let airline_solarized_bg = 'dark'
let g:airline_theme= 'solarized'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" filename only
" let g:airline_section_c = '%t'

"let g:airline#extensions#default#section_truncate_width = {
"      \ 'b': 79,
"      \ 'x': 100,
"      \ 'y': 110,
"      \ 'z': 45,
"      \ 'warning': 80,
"      \ 'error': 80,
"      \ }

"truncate long branch names to a fixed length >
"let g:airline#extensions#branch#displayed_head_limit = 10

" Setting for NERDTree git integration
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" air-line
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" setting for CtrlP
let g:ctrlp_cmd = 'CtrlPBuffer'

" Integrate vimtex with deoplete
" if !exists('g:deoplete#omni#input_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif
" let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

" Set zathura as the pdf viewer
" let g:vimtex_view_method = 'zathura'

" Compiler callbacks ?
" let g:vimtex_compiler_progname = 'nvr'


""" Perl specific settings
:au Filetype perl nmap <F3> :%!perltidy -b -bext='/' %<CR>

"let g:syntastic_enable_perl_checker = 1
"let g:syntastic_perl_checkers=['perl']
"let g:syntastic_perl_lib_path = [ 'put additional perl libraries here' ]
let perl_include_pod   = 1    "include pod.vim syntax file with perl.vim"
let perl_extended_vars = 1    "highlight complex expressions such as @{[$x, $y]}"
let perl_sync_dist     = 250  "use more context for highlighting"
let perl_fold       = 1

""" Settings for python

let g:python_host_prog = '/home/ian/miniconda2/envs/vpython2/bin/python'
let g:python3_host_prog = '/home/ian/miniconda2/envs/nvimpy/bin/python'

"let g:syntastic_python_pylint_exe = '/home/ian/miniconda2/envs/nvimpy/bin/python -m pylint3'

" ALE settings
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8'],
\}

autocmd FileType python  nmap <F3> <Plug>(ale_fix)

nmap <silent> ]a :ALENext<cr>
nmap <silent> [a :ALENext<cr>

command Diff execute 'w !git diff --no-index % -'
"autocmd FileType python map <buffer> <F3> : call Flake8()<CR>

au BufNewFile,BufRead *.py
    \ set textwidth=99 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Enable indentation autodetect
let g:detectindent_autodetect = 1
let g:detectindent_preferred_indent = 4

augroup DetectIndent
  autocmd!
  autocmd BufReadPost *  DetectIndent
augroup END

function! IndentIgnoringBlanks(child)
  let lnum = v:lnum
  while v:lnum > 1 && getline(v:lnum-1) == ""
    normal k
    let v:lnum = v:lnum - 1
  endwhile
  if a:child == ""
    if ! &l:autoindent
      return 0
    elseif &l:cindent
      return cindent(v:lnum)
    endif
  else
    exec "let indent=".a:child
    if indent != -1
      return indent
    endif
  endif
  if v:lnum == lnum && lnum != 1
    return -1
  endif
  let next = nextnonblank(lnum)
  if next == lnum
    return -1
  endif
  if next != 0 && next-lnum <= lnum-v:lnum
    return indent(next)
  else
    return indent(v:lnum-1)
  endif
endfunction
command! -bar IndentIgnoringBlanks
            \ if match(&l:indentexpr,'IndentIgnoringBlanks') == -1 |
            \   if &l:indentexpr == '' |
            \     let b:blanks_indentkeys = &l:indentkeys |
            \     if &l:cindent |
            \       let &l:indentkeys = &l:cinkeys |
            \     else |
            \       setlocal indentkeys=!^F,o,O |
            \     endif |
            \   endif |
            \   let b:blanks_indentexpr = &l:indentexpr |
            \   let &l:indentexpr = "IndentIgnoringBlanks('".
            \   substitute(&l:indentexpr,"'","''","g")."')" |
            \ endif
command! -bar IndentNormally
            \ if exists('b:blanks_indentexpr') |
            \   let &l:indentexpr = b:blanks_indentexpr |
            \ endif |
            \ if exists('b:blanks_indentkeys') |
            \   let &l:indentkeys = b:blanks_indentkeys |
            \ endif
augroup IndentIgnoringBlanks
  au!
  au FileType *.py IndentIgnoringBlanks
augroup END

" Fold settings for Python
" Currently Disabled. Not sure if it works with nvim
"autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinEnter *.py setlocal foldmethod=indent foldnestmax=2
"autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

let python_highlight_all=1

" Python-mode plugin settings

let g:pymode = 0 " Turn on/off

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
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # XXX BREAKPOINT'

" Disable syntax highlighting (using ale)
let g:pymode_syntax = 0
let g:pymode_syntax_all = 0
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Autofold code with pymode
let g:pymode_folding = 0

" Set to python 3
let g:pymode_python = 'python'

" pep8 compatible indentation
let g:pymode_indent = 1

" python motion
let g:pymode_motion = 1

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
