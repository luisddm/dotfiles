set number
set nocompatible              " be iMproved, required
filetype off                  " required

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
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'
Plugin 'yggdroot/indentline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'hdima/python-syntax'
Plugin 'airblade/vim-gitgutter'
Plugin 'raimondi/delimitmate'
Plugin 'easymotion/vim-easymotion'

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

" Color theme
syntax on
syntax enable
colorscheme PaperColor
set background=dark
let g:airline_theme='wombat'

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
