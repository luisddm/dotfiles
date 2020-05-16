set encoding=UTF-8            " Default encoding

set number                    " Show line numbers
set nocompatible
filetype off

let mapleader=","             " Set leader key

set clipboard=unnamedplus     " Use system clipboard

set mouse=a                   " Enable mouse support, forgive me vim father because I have sin

set noerrorbells              " No annoying sounds on errors
set novisualbell

" Tabulations
set smartindent               " Do smart autoindenting when starting a new line
set expandtab                 " Use the appropiate number of spaces to insert a <Tab> in insert mode
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=2
filetype plugin indent on

" Highlight current cursor line in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" Delay for some operations to take place
set updatetime=100

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" List of Vundle plugins
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'python-mode/python-mode'
Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'
Plugin 'yggdroot/indentline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'hdima/python-syntax'
Plugin 'airblade/vim-gitgutter'
Plugin 'raimondi/delimitmate'
Plugin 'easymotion/vim-easymotion'
Plugin 'ryanoasis/vim-devicons'
Plugin 'dense-analysis/ale'
Plugin 'elzr/vim-json'
Plugin 'davidhalter/jedi-vim'
Plugin 'mhinz/vim-startify'

call vundle#end()
filetype plugin indent on

" Whitespaces
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Map ctrl+x for Nerdreee and show hidden files
map <C-x> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Color theme
syntax on
syntax enable
colorscheme PaperColor
set background=dark
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1             " This requires a nerd font
let g:airline#extensions#ale#enabled = 1

" Set indent line character for indentline plugin
let g:indentLine_char = '▏'

" Some hightlight settings for Python and JS
augroup PythonAndJSCustomization
  " Highlight object (usually something followed by a period) with the color of a comment
  autocmd Filetype python syntax match pythonComment "\<\w\+\ze\."
  autocmd Filetype javascript syntax match pythonComment "\<\w\+\ze\."
  " Highlight self and this with the color of a boolean
  autocmd FileType python syntax match pythonBoolean "\<self\ze\."
  autocmd FileType javascript syntax match pythonBoolean "\<this\ze\."
augroup END

" Press F12 to paste without modifying indentation
set pastetoggle=<F12>

" Ale linting
let g:ale_linters = {'python': ['pylint']}
let g:ale_python_executable='python'
let g:ale_python_pylint_use_global=1
let g:airline#extensions#ale#enabled=1

" Disable pymode-linting to avoid redundancy with ale linting
let g:pymode_lint = 0

" Use F3 to search and replace word under cursor
" :nnoremap <F3> :%s/\<<C-r><C-w>\>/
:nnoremap <F3> :%s/\<<C-r><C-w>\>//g<Left><Left>

" Exclude swap or cache files using Vim's wildignore
set wildignore+=*.swp,*.pyc

" If a file is changed outside of vim, automatically reload it
set autoread

" Don't generate swap files in vim
set noswapfile
set nobackup
set nowb

" Use ag (silver searcher) when available for searching with ack.vim plugin
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Find full word under cursor in every file of the project
nnoremap <leader>1 :Ack! '\b<cword>\b'<cr>
nnoremap <leader>2 :Ack! <cword> <cr>

" Remap some commands when saving and exiting
command Q q
command W w
command WQ wq
command Wq wq
command QA qa
command Qa qa
command! -bar -bang Q quit<bang>

" Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Search files with ctrl + p
let g:ctrlp_cmd = 'CtrlPMixed'    " search for mru, buffer and files all together
let g:ctrlp_max_depth = 15        " maximum directory depth
let g:ctrlp_max_history = 5       " The maximum number of input strings you want CtrlP to remember
let g:crlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'
noremap <F4> :CtrlPFunky<CR>
let g:ctrlp_funky_syntax_highlight = 1

" Don't hide quotes in json files (vim-json hides them by default)
let g:vim_json_syntax_conceal = 0
let g:indentLine_noConcealCursor=""