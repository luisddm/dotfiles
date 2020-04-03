set number
set nocompatible              " be iMproved, required
filetype off                  " required

set encoding=UTF-8

let mapleader=","

" Use system clipboard
set clipboard=unnamedplus

set mouse=a

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
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
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'hdima/python-syntax'
Plugin 'airblade/vim-gitgutter'
Plugin 'raimondi/delimitmate'
Plugin 'easymotion/vim-easymotion'
Plugin 'ryanoasis/vim-devicons'
Plugin 'dense-analysis/ale'
Plugin 'elzr/vim-json'
Plugin 'davidhalter/jedi-vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Map Ctrl+x for Nerdreee
map <C-x> :NERDTreeToggle<CR>
" Show hidden files in nerdtree
let NERDTreeShowHidden=1

" Color theme
syntax on
syntax enable
colorscheme PaperColor
set background=dark
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

let g:indentLine_char = '▏'

" Use ag when available for searching
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

augroup PythonCustomization
  " highlight python object, when followed by a comma, a period or a parenth
  autocmd Filetype python syntax match pythonComment "\<\w\+\ze\."
  autocmd Filetype javascript syntax match pythonComment "\<\w\+\ze\."
  " highlight python self, when followed by a comma, a period or a parenth
  autocmd FileType python syntax match pythonBoolean "\<self\ze\."
  autocmd FileType javascript syntax match pythonBoolean "\<this\ze\."
augroup END


"para poder pegar sin que idente formato presionamos f12
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)


" ==== ControlP ====
" con control+p lista los directorios y archivos que esten en ese directorio
" lo que pernece a un control de versiones que este proximo en nivel de
" directorios
" control+f te mueves entre las opciones
" control+r activa/desactiva la busqueda por expresion regular
" control+t te lo abre un nuevo tab lo que tengas seleccionado
" control+y te crea el fichero con ese nombre y los directorios si lo has indicado
" control+p seleccionas nombre :linea te lo abre y va a esa linea
" control+x abre con split horizontal
" control+v abre con split vertical
" f5 refresca la cache de ficheros
"
" ControlP permite user expresiones reguarles
"
" Exclude files or directories using Vim's wildignore:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/venv/*,node_modules,bower_components,*.pyc   " Linux/MacOSX

" let g:ctrlp_map = '<c-p>'
" CtrlPMixed offers a search for mru, buffer and files all together
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'
" maximum directory depth
let g:ctrlp_max_depth = 15
" The maximum number of input strings you want CtrlP to remember
" 5 it's enough for me
let g:ctrlp_max_history = 5

" ctrp - funky
noremap <F4> :CtrlPFunky<CR>
let g:ctrlp_funky_syntax_highlight = 1


" clear search when press esc
" map <esc> :noh<esc><cr>
" replace text under cursor
" https://vim.fandom.com/wiki/Search_and_replace_the_word_under_the_cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/



" ------ Ack / ag
" silver searcher wit ack.vim plugin
let g:ackprg = 'ag --vimgrep --ignore=composer*'
" bind leader + / to find full word under cursor
nnoremap <leader>1 :Ack! '\b<cword>\b'<cr>
nnoremap <leader>2 :Ack! <cword> <cr>

" disable pymode-linting avoid duplicity
let g:pymode_lint = 0

let g:ale_linters = {'python': ['pylint']}
let g:ale_python_executable='python'
let g:ale_python_pylint_use_global=1

let g:vim_json_syntax_conceal = 0

" Remove swap files in vim
set noswapfile
set nobackup
set nowb
