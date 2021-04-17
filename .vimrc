"           ██
"          ░░
"  ██    ██ ██ ██████████  ██████  █████
" ░██   ░██░██░░██░░██░░██░░██░░█ ██░░░██
" ░░██ ░██ ░██ ░██ ░██ ░██ ░██ ░ ░██  ░░
"  ░░████  ░██ ░██ ░██ ░██ ░██   ░██   ██
"   ░░██   ░██ ███ ░██ ░██░███   ░░█████
"    ░░    ░░ ░░░  ░░  ░░ ░░░     ░░░░░
"
"  ▓▓▓▓▓▓▓▓▓▓▓▓
" ░▓ author   ▓ lu1sdev
" ░▓ code     ▓ https://github.com/lu1sdev/dotfiles/
" ░▓ based on ▓ https://github.com/aleasoluciones/dotfiles/
" ░▓▓▓▓▓▓▓▓▓▓▓▓
" ░░░░░░░░░░░░

""""""""""""""""""""""
" base configuration "
""""""""""""""""""""""
let mapleader = ',' " Map leader key to comma

set number " Show line number
set encoding=utf-8 " utf-8 encoding
set nocompatible
syntax on " Syntax highlighting
set nowrap " Do not wrap long lines
set encoding=utf8 " UTF-8 encoding
set ruler
set mouse=a " Automatically enable mouse usage
filetype off
filetype plugin indent on

" Indentation
set tabstop=4 " show existing tab with 4 spaces width
set softtabstop=4
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces
set smarttab
set autoindent

set cursorline
set ttyfast " Improves scroll performance
set ignorecase " Case insensitive searches

" search
set hlsearch " Highlight search matches
set incsearch " Incremental search

" Remove swap files in vim
set noswapfile
set nobackup
set nowb

" folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

set list
set listchars=tab:▸\ ,eol:¬

" Use 2 spaces to indent JS and Typescript files
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab

"""""""""""""""""""""""""
" plugins configuration "
"""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " plugins manager

" git integration
Plugin 'tpope/vim-fugitive'

" autocompletion
Plugin 'ervandew/supertab' " supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs (:help ins-completion)
Plugin 'davidhalter/jedi-vim' " awesome Python autocompletion with VIM
Plugin 'honza/vim-snippets' " this repository contains snippets files for various programming languages

" tabs
Plugin 'mkitt/tabline.vim' " Configure tabs within Terminal Vim

" cursor
Plugin 'wincent/terminus' " apply some terminal improvements like cursor, insert paste
Plugin 'mg979/vim-visual-multi', {'branch': 'master'} " multicursor

" ctags
Plugin 'majutsushi/tagbar' " Requires Universal Ctags https://docs.ctags.io/en/latest/autotools.html
Plugin 'ludovicchabant/vim-gutentags' " autogen tags

" bookmarks
Plugin 'MattesGroeger/vim-bookmarks' " Bookmarks plugin for Vim

" comment with gc
Plugin 'tpope/vim-commentary'

" nerdtree
Plugin 'scrooloose/nerdtree' " file browser
Plugin 'Xuyuanp/nerdtree-git-plugin'

" vim airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" search
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'

" go
Plugin 'fatih/vim-go' " Go development plugin for Vim

" python
Plugin 'python-mode/python-mode'
Plugin 'vim-python/python-syntax'
Plugin 'hynek/vim-python-pep8-indent'

" linter
Plugin 'dense-analysis/ale' " ale code linter

" Ctrl+P
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'

" color schemes and icons
Plugin 'morhetz/gruvbox'
Plugin 'nlknguyen/papercolor-theme'
Plugin 'ryanoasis/vim-devicons' " use dev icons

" Surround text
Plugin 'tpope/vim-surround'
Plugin 'raimondi/delimitmate'

" show indent lines
Plugin 'yggdroot/indentline'

" editorconfig
Plugin 'editorconfig/editorconfig-vim'

" jinja2
Plugin 'glench/vim-jinja2-syntax'

call vundle#end()

""""""""""""""""""
" plugins config "
""""""""""""""""""
" nerdtree
map <C-x> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <Leader>s :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.orig$', '\.egg-info', '__pycache__', '\.sw*$', '\.swp'] " Ignore files
let NERDTreeShowHidden=1

" airline
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme= 'wombat'

" vim-go
let g:go_fmt_command = "goimports" " Default golang formater

" fzf
map ; :FZF<CR>
if executable('batcat')
    let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,1 --preview 'batcat --color=always --style=header,grid --line-range :300 {}'"
endif
if executable('fdfind')
    let $FZF_DEFAULT_COMMAND = 'fdfind --hidden --type file -E ".git/"'
endif

" ack
" Use ag (silver searcher) when available for searching with ack.vim plugin
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" ale
let g:ale_linters = {
\   'python': ['pylint'],
\}
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
let g:ale_set_highlights = 0

" ctrl+p
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|pyc))$'

" indentline
let g:indentLine_char = '▏'

" tagbar
let g:tagbar_width=45
let g:tagbar_autofocus=1
let g:tagbar_expand=1
let g:tagbar_singleclick=1
let g:tagbar_autoshowtag=1

"""""""""""""""
" key mapping "
"""""""""""""""
" Fix behavior in insert mode inside tmux session
nnoremap <Esc>A <up>
nnoremap <Esc>B <down>
nnoremap <Esc>C <right>
nnoremap <Esc>D <left>
inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>

" tabs navigation
map <C-t> :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" go to tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt

" map copy to clipboard to be CTRL + C
:vmap <C-c> "+y

" redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" function keys
nnoremap <F2> :! mamba -f documentation %:p<CR>
nnoremap <F3> :call TagInNewTab()<CR>
nnoremap <F4> :Ag <C-r><C-w><CR>
nnoremap <F8> :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <F10> :TagbarToggle<CR>

"""""""""""
" aliases "
"""""""""""
command Q q
command W w
command WQ wq
command Wq wq
command QA qa
command Qa qa
command! -bar -bang Q quit<bang>

""""""""""
" themes "
""""""""""
syntax enable
colorscheme PaperColor
set background=dark

let g:PaperColor_Theme_Options = {
    \   'language': {
    \     'python': {
    \       'highlight_builtins': 1
    \     }
    \   }
    \ }

"Highlight some python syntax patterns
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

"""""""""""""
" functions "
"""""""""""""
" Remove all trailing spaces on save
" http://vimcasts.org/episodes/tidying-whitespace
function! Preserve(command)
    let _s=@/
    let l = line(".")
    let c = col(".")
    execute a:command
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

" open tag in new tab
function! TagInNewTab()
    let word = expand("<cword>")
    redir => tagsfiles
    silent execute 'set tags'
    redir END
    tabe
    execute 'setlocal' . strpart(tagsfiles, 2)
    execute 'tag ' . word
endfunction
