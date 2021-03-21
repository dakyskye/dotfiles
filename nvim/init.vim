let mapleader="\<space>"

set syntax=on
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
set shortmess+=c
set signcolumn=number
set noshowmode
set number relativenumber
set t_Co=256
set termguicolors

if !exists('g:vscode')
	if empty(glob('~/.config/nvim/autoload/plug.vim'))
		silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		:qa!
	endif

	call plug#begin('~/.config/nvim/bundle')

	" Git
	Plug 'tpope/vim-fugitive'
	Plug 'kdheepak/lazygit.nvim'
	" EditorConfig
	Plug 'editorconfig/editorconfig-vim'
	" FZF
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	" Maximizer
	Plug 'szw/vim-maximizer'
	" Surround
	Plug 'tpope/vim-surround'
	" Floaterm
	Plug 'voldikss/vim-floaterm'
	" Treesitter
	Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSInstall all' }
	" One
	Plug 'kdheepak/vim-one'
	" Airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" Devicons
	Plug 'ryanoasis/vim-devicons'
	" Goyo
	Plug 'junegunn/goyo.vim'
	" Limelight
	Plug 'junegunn/limelight.vim'
	"""
	call plug#end()

	" config
	"""

	set background=dark
	colorscheme one

	" treesitter
	lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

	" one
	let g:one_allow_italics = 1

	" airline
	let g:airline_powerline_fonts = 1
	let g:airline_theme = 'one'
endif
