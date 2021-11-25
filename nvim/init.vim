set syntax=off
set noswapfile
set nobackup
set nowritebackup
set confirm
set autoread
set lazyredraw
set iskeyword+=-
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
set timeoutlen=500
set shortmess+=c
set signcolumn=auto
set noshowmode
set number relativenumber
set t_Co=256
set termguicolors

if !exists('g:vscode')
	source ~/.config/nvim/config.vim
	source ~/.config/nvim/plugins.vim
endif
