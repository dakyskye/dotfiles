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
		Plug 'nvim-lualine/lualine.nvim'
		Plug 'tpope/vim-commentary'
		Plug 'tpope/vim-surround'
		Plug 'editorconfig/editorconfig-vim'
		Plug 'windwp/nvim-autopairs'
		Plug 'andymass/vim-matchup'
		Plug 'lewis6991/gitsigns.nvim'
		" Plug 'github/copilot.vim'
		Plug 'nvim-tree/nvim-tree.lua'
		Plug 'folke/which-key.nvim'
		Plug 'nvim-treesitter/nvim-treesitter'
		" those are telescope.nvim dependencies
		Plug 'nvim-lua/plenary.nvim'
		Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
		Plug 'nvim-tree/nvim-web-devicons'
		" those are telescope.nvim dependencies
		Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
		Plug 'neovim/nvim-lspconfig'
		" auto completion
		Plug 'hrsh7th/cmp-nvim-lsp'
		Plug 'hrsh7th/cmp-buffer'
		Plug 'hrsh7th/cmp-path'
		Plug 'hrsh7th/cmp-cmdline'
		Plug 'hrsh7th/nvim-cmp'
		Plug 'hrsh7th/cmp-vsnip'
		Plug 'hrsh7th/vim-vsnip'

		Plug 'ray-x/lsp_signature.nvim'
	call plug#end()
endif

colorscheme one
set background=light

hi link @text.diff.add DiffAdd
hi link @text.diff.delete DiffDelete

lua require'nvim-autopairs'.setup{}
lua require 'treesitter_cfg'
lua require 'telescope_cfg'
lua require 'lsp_cfg'
lua require 'completion_cfg'
lua require'lsp_signature'.setup{}
lua require 'gitsigns_cfg'
lua require 'nvim-tree_cfg'
lua require 'which-key_cfg'
lua require 'lualine_cfg'

"copilot keybindings need remapping to ⌥ on mac
"ALT-]
inoremap ‘ <Plug>(copilot-next)
"ALT-[
inoremap “ <Plug>(copilot-previous)
"ALT-\
inoremap « <Plug>(copilot-suggest)

set completeopt=menu,menuone,noselect
