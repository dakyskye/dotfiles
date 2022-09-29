if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

if exists('g:vscode')
	call plug#begin()
		Plug 'tpope/vim-commentary'
		Plug 'tpope/vim-surround'
	call plug#end()
	finish
else
	call plug#begin()
		Plug 'kdheepak/vim-one'
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
		Plug 'tpope/vim-commentary'
		Plug 'tpope/vim-surround'
		Plug 'editorconfig/editorconfig-vim'
		Plug 'windwp/nvim-autopairs'
		Plug 'andymass/vim-matchup'
		Plug 'nvim-treesitter/nvim-treesitter'
	call plug#end()
endif

colorscheme one
set background=light

let g:airline_powerline_fonts = 1
let g:airline_theme = 'one'

lua require'nvim-autopairs'.setup{}
lua require 'treesitter_cfg'

set completeopt=menu,menuone,noselect