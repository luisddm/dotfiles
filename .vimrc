"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░
"
"  ▓▓▓▓▓▓▓▓▓▓
" ░▓ author ▓ luisddm
" ░▓ code   ▓ https://github.com/luisddm/dotfiles/
" ░▓▓▓▓▓▓▓▓▓▓
" ░░░░░░░░░░

set nocompatible                " Be iMproved, required
filetype off                    " Required before Vundle

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Themes
Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'
Plugin 'nlknguyen/papercolor-theme'
Plugin 'joshdick/onedark.vim'

" NERDtree
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'

" Icons (requires nerd font)
Plugin 'ryanoasis/vim-devicons'
Plugin 'her/synicons.vim'

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Lightline
Plugin 'itchyny/lightline.vim'
Plugin 'taohexxx/lightline-buffer'

" Python
Plugin 'vim-python/python-syntax'
Plugin 'python-mode/python-mode'

" Commenting
Plugin 'tpope/vim-commentary'

" Searching
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'mileszs/ack.vim'

" ?
Plugin 'ervandew/supertab'
Plugin 'yggdroot/indentline'
Plugin 'editorconfig/editorconfig-vim'

" Purge whitespaces
Plugin 'ntpeters/vim-better-whitespace'

" Autoclosing
Plugin 'raimondi/delimitmate'

" Linting
Plugin 'dense-analysis/ale'
Plugin 'maximbaz/lightline-ale'

" JSON files
Plugin 'elzr/vim-json'

" Rust
Plugin 'rust-lang/rust.vim'

call vundle#end()

filetype plugin indent on       " Once Vundle has finished loading, we can turn this on

let mapleader=","               " Set leader key

set number                      " Line numbers are good
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set ruler                       " Add the current line and column
set clipboard=unnamedplus       " Use system clipboard
set mouse=a                     " Enable mouse support, forgive me vim father because I have sin

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" Searching
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" Don't generate swap files
set noswapfile
set nobackup
set nowb

" Exclude swap or cache files using Vim's wildignore
set wildignore+=*.swp,*.pyc

" Delay for some operations to take place
set updatetime=100

" Lightline config
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

" Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Remap some commands when saving and exiting
command Q q
command W w
command WQ wq
command Wq wq
command QA qa
command Qa qa
command! -bar -bang Q quit<bang>

" Map save and quit
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" Navigate tabs
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>

" Style and theme
syntax enable
colorscheme PaperColor
set background=dark

" PaperColor theme config
let g:PaperColor_Theme_Options = {
    \   'language': {
    \     'python': {
    \       'highlight_builtins': 1
    \     }
    \   }
    \ }

" Highlight some python syntax patterns
augroup PythonHighlightCustomization
    " Constants and numbers TODO include decimal numbers
    autocmd Filetype python syntax match octaveSemicolon "\<\([A-Z][A-Z0-9_]\+\)\>"
    " Functions
    autocmd Filetype python syntax match plantumlParticipant '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\ze\%(\s*(\)'
    " Objects
    autocmd Filetype python syntax match pythonComment "\<\w\+\ze\."
    " Keyword params
    autocmd FileType python syntax match javaScriptReserved "\v\s{-}\zs\w+\ze\=(\=)@!(\_s)@!"
augroup END

" Highlight current line in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" Press F12 to paste without modifying indentation
set pastetoggle=<F12>

" Use F3 to search and replace word under cursor
nnoremap <F2> :%s/\<<C-r><C-w>\>//g<Left><Left>

" Config default command for fzf
let $FZF_DEFAULT_COMMAND = 'fdfind --hidden --type file --ignore-file .gitignore'

" Execute fzf with preview
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--info=inline', '--preview', 'batcat --color=always --line-range :96 {}']}, <bang>0)
nnoremap <leader>f :Files<CR>

" Execute Mamba test runner if available
if executable('mamba')
    command Mambo ! mamba -f documentation %:p
    nnoremap <leader>m :Mambo<CR>
endif

" NERDTree
map <C-x> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.pyc$', '\.orig$', '\.egg-info', 'pycache', '\.sw*$']

" Python syntax
let g:python_highlight_all = 1

" Ale linting
let g:ale_linters = {'python': ['pylint']}
let g:ale_python_executable = 'python'
let g:ale_python_pylint_use_global = 1

" Disable pymode-linting to avoid redundancy with ale linting
let g:pymode_lint = 0

" Set indent line character for indentline plugin
let g:indentLine_char = '▏'

" Whitespaces
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1

" Use ag (silver searcher) when available for searching with ack.vim plugin
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Find full word under cursor in every file of the project
nnoremap <leader>1 :Ack! '\b<cword>\b'<cr>
nnoremap <leader>2 :Ack! <cword> <cr>

" Search files with CtrlP
let g:ctrlp_cmd = 'CtrlPMixed'    " search for mru, buffer and files all together
let g:ctrlp_max_deph = 15         " maximum directory depth
let g:ctrlp_max_history = 5       " The maximum number of input strings you want CtrlP to remember
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'
let g:ctrlp_user_command = 'fdfind --hidden --type file --ignore-file .gitignore'

" Funky
noremap <F4> :CtrlPFunky<CR>
let g:ctrlp_funky_syntax_highlight = 1

" Turn off highlight of search results
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Don't hide quotes in json files (vim-json hides them by default)
let g:vim_json_syntax_conceal = 0
let g:indentLine_noConcealCursor = ""

" Lightline config (based on the example showed when executing :h lightline-powerful-example)
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
    \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ] ]
    \ },
    \ 'component_function': {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \   'fugitive': 'LightlineFugitive',
    \   'filename': 'LightlineFilename',
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype',
    \   'fileencoding': 'LightlineFileencoding',
    \   'mode': 'LightlineMode',
    \   'ctrlpmark': 'CtrlPMark',
    \ },
    \ 'component': {
    \   'lineinfo': '%3l:%-2v',
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \   'linter_checking': 'lightline#ale#checking',
    \   'linter_infos': 'lightline#ale#infos',
    \   'linter_warnings': 'lightline#ale#warnings',
    \   'linter_errors': 'lightline#ale#errors',
    \   'linter_ok': 'lightline#ale#ok',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \   'linter_checking': 'right',
    \   'linter_infos': 'right',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'left',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }

" TODO https://github.com/taohexxx/lightline-buffer

function! LightlineModified()
    return &ft ==# 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
    return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! LightlineFilename()
    let fname = expand('%:f')
    return fname ==# 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname =~# '^__Tagbar__\|__Gundo\|NERD_tree' ? '' :
        \ &ft ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft ==# 'unite' ? unite#get_status_string() :
        \ &ft ==# 'vimshell' ? vimshell#get_status_string() :
        \ (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
        \ (fname !=# '' ? fname : '[No Name]') .
        \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
    try
        if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*FugitiveHead')
            let mark = ' '  " edit here for cool mark
            let branch = FugitiveHead()
            return branch !=# '' ? mark.branch : ''
        endif
    catch
    endtry
    return ''
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
    let fname = expand('%:t')
    return fname =~# '^__Tagbar__' ? 'Tagbar' :
        \ fname ==# 'ControlP' ? 'CtrlP' :
        \ fname ==# '__Gundo__' ? 'Gundo' :
        \ fname ==# '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~# 'NERD_tree' ? 'NERDTree' :
        \ &ft ==# 'unite' ? 'Unite' :
        \ &ft ==# 'vimfiler' ? 'VimFiler' :
        \ &ft ==# 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
    if expand('%:t') ==# 'ControlP' && has_key(g:lightline, 'ctrlp_item')
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item, g:lightline.ctrlp_next], 0)
    else
        return ''
    endif
endfunction

let g:ctrlp_status_func = {
    \ 'main': 'CtrlPStatusFunc_1',
    \ 'prog': 'CtrlPStatusFunc_2',
    \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
    return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    return lightline#statusline(0)
endfunction

let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\u2714 "

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" enable devicons, only support utf-8
" require <https://github.com/ryanoasis/vim-devicons>
let g:lightline_buffer_enable_devicons = 1

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1

" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'

" hide buffer list
let g:lightline_buffer_excludes = ['nerdtree']

" max file name length
let g:lightline_buffer_maxflen = 30

" max file extension length
let g:lightline_buffer_maxfextlen = 3

" min file name length
let g:lightline_buffer_minflen = 16

" min file extension length
let g:lightline_buffer_minfextlen = 3

" reserve length for other component (e.g. info, close)
let g:lightline_buffer_reservelen = 20
