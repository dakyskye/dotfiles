if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()
	Plug 'kdheepak/vim-one'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'kyazdani42/nvim-web-devicons' " nvim-tree depends on this
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'nvim-lua/plenary.nvim' " telescope depends on this
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'windwp/nvim-autopairs'
	Plug 'andymass/vim-matchup'
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'mhartington/formatter.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'ray-x/lsp_signature.nvim'
	Plug 'onsails/lspkind-nvim'
call plug#end()

colorscheme one
set background=dark

let g:airline_powerline_fonts = 1
let g:airline_theme = 'one'

lua require'nvim-tree'.setup{}

lua require 'telescope_cfg'
nnoremap <silent> <S-e>      <cmd>Telescope<cr>
nnoremap <silent> <leader>ff <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent> <leader>fh <cmd>Telescope help_tags<cr>

lua require'nvim-autopairs'.setup{}
lua require 'treesitter_cfg'

set completeopt=menu,menuone,noselect
lua require 'formatter_cfg'
lua require 'lspconfig_cfg'
lua require 'lsp_signature'.setup()
