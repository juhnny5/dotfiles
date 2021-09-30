" Standard Vim setup
syntax on
filetype plugin on
set mouse=r
set noswapfile
set autoindent
set smartindent
set nocompatible
set number
set laststatus=2
set t_Co=256
set noshowmode
set autowrite
set termguicolors
colorscheme monokai_pro

" This script contains plugin specific settings
source ~/.vimrc.d/plugins.vim

" This script contains mapping
source ~/.vimrc.d/mapping.vim

" Additional helper functions
source ~/.vimrc.d/functions.vim

" Additional buffers
source ~/.vimrc.d/buffers.vim

" Import extras
source ~/.vimrc.d/extras.vim

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * call StartUp()

" File type detection for indentation
if has("autocmd")
  filetype indent on
  filetype plugin indent on
endif

