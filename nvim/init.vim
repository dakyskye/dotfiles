source '~/.config/nvim/shared.vim'

call plug#begin('~/AppData/Local/nvim/bundle')

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
