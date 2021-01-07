if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	:qa!
endif

call plug#begin('~/.config/nvim/bundle')
"
" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git client
Plug 'mhinz/vim-signify'
"
" editorconfig
Plug 'editorconfig/editorconfig-vim'

" fzf for file browsing
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" polyglot to syntax highlight for most languages
Plug 'sheerun/vim-polyglot'

" airline for fancy status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" onedark theme
Plug 'joshdick/onedark.vim'


call plug#end()

" config
set syntax=on
set noswapfile
set nobackup
set nowritebackup
set confirm
set autoread
set lazyredraw
set exrc
set secure
set encoding=utf-8
set clipboard=unnamedplus
set mouse=a
set cursorline
set splitbelow splitright
set autoindent
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set incsearch
set hlsearch
set hidden
set cmdheight=1
set updatetime=100
set shortmess+=c
set signcolumn=yes
set noshowmode
set number relativenumber
set t_Co=256
set termguicolors

" UI
let g:onedark_terminal_italics=1
let g:airline_theme='onedark'

colorscheme onedark

let g:coc_global_extensions = [ 'coc-highlight' ]
