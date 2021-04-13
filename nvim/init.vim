source ~/.config/nvim/shared.vim

if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	:qa!
endif

call plug#begin('~/.config/nvim/plugged')

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

set guifont=JetBrainsMono\ Nerd\ Font:h12
set background=dark
colorscheme one

" treesitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" one
let g:one_allow_italics = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'one'
