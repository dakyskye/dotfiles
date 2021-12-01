" Install vim-plug if not found
" if empty(glob('$LOCALAPPDATA/nvim/autoload/plug.vim'))
" 	silent ! powershell -Command "
" 		\ 	New-Item -Path $env:LOCALAPPDATA\nvim -Name autoload -Type Directory -Force;
" 		\ 	Invoke-WebRequest
" 		\ 	-Uri 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" 		\ 	-OutFile $env:LOCALAPPDATA\nvim\autoload\plug.vim
" 	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()
	" UI
	Plug 'kdheepak/vim-one'

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Limelight
	Plug 'junegunn/limelight.vim'

	" Buffer maximiser
	Plug 'szw/vim-maximizer'

	" Utilities
	" File explorer
	Plug 'kyazdani42/nvim-web-devicons' " nvim-tree depends on this
	Plug 'kyazdani42/nvim-tree.lua'

	" Terminal
	Plug 'akinsho/toggleterm.nvim'

	" Keybinding helper
	Plug 'folke/which-key.nvim'

	" Quickly comment/uncomment code
	Plug 'tpope/vim-commentary'

	" Quickly jump and navigate
	Plug 'ggandor/lightspeed.nvim'

	Plug 'nvim-lua/plenary.nvim' " telescope depends on this
	Plug 'nvim-telescope/telescope.nvim'

	" IDE
	" Portability
	Plug 'editorconfig/editorconfig-vim'

	" Pairing
	Plug 'windwp/nvim-autopairs'

	" Syntax highlighting & colours
	Plug 'andymass/vim-matchup'
	Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'nvim-lua/plenary.nvim' " todo-comments depend on this
	Plug 'folke/todo-comments.nvim'

	" Markdown preview
	Plug 'ellisonleao/glow.nvim'

	" Git
	Plug 'kdheepak/lazygit.nvim'
	Plug 'tpope/vim-fugitive'
	Plug 'nvim-lua/plenary.nvim' " gitsigns depends on this
	Plug 'lewis6991/gitsigns.nvim'

	" LSP, Completion, and formatting
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


" UI
" one dark
colorscheme one
set background=dark

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'one'

" Limelight & Maximiser
nnoremap <silent><leader>bl :Limelight!!<cr>
nnoremap <silent><leader>bm :MaximizerToggle<cr>

" Utilities
" Nvim-tree
lua require'nvim-tree'.setup{}
nnoremap <silent> <C-e> :NvimTreeToggle<cr>

" Toggleterm
lua require 'toggleterm_cfg'

" Which-key
lua require'which-key'.setup{}

" Telescope
lua require 'telescope_cfg'
nnoremap <silent> <S-e> :Telescope<cr>

" IDE
" Pairing
lua require'nvim-autopairs'.setup{}
" Tree-sitter
lua require 'treesitter_cfg'
" Colorizer
lua require'colorizer'.setup()
" Comment highlighter
lua require'todo-comments'.setup()

nnoremap <silent> <C-b> :Telescope buffers<cr>

" Glow
let g:glow_border = "rounded"
nnoremap <silent> <leader>p :Glow<cr>

" Git
nnoremap <silent> <leader>gg :LazyGit<cr>

lua require 'gitsigns_cfg'

" LSP & Completions
set completeopt=menu,menuone,noselect

lua require'formatter_cfg'
lua require 'lspconfig_cfg'
lua require 'lsp_signature'.setup()

augroup FormatAug
	autocmd!
	autocmd BufWritePost *.go,*.py FormatWrite
augroup END
