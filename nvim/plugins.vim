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
		Plug 'navarasu/onedark.nvim'
		Plug 'f-person/auto-dark-mode.nvim'
		Plug 'nvim-lualine/lualine.nvim'
		Plug 'tpope/vim-commentary'
		Plug 'tpope/vim-surround'
		Plug 'editorconfig/editorconfig-vim'
		Plug 'windwp/nvim-autopairs'
		Plug 'andymass/vim-matchup'
		Plug 'lewis6991/gitsigns.nvim'
		Plug 'tpope/vim-fugitive'
		Plug 'junegunn/gv.vim'
		" Plug 'github/copilot.vim'
		Plug 'nvim-tree/nvim-tree.lua'
		Plug 'folke/which-key.nvim'
		Plug 'nvim-treesitter/nvim-treesitter'
		" those are telescope.nvim dependencies
		Plug 'nvim-lua/plenary.nvim'
		Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
		Plug 'nvim-tree/nvim-web-devicons'
		" those are telescope.nvim dependencies
		Plug 'nvim-telescope/telescope.nvim'
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
		Plug 'coder/claudecode.nvim'
	call plug#end()
endif

lua << EOF
local onedark = require('onedark')
local tree_bg = { dark = '$bg0', light = '$bg0' }
local function setup(style)
    onedark.setup {
        style = style,
        highlights = {
            NvimTreeNormal = { bg = tree_bg[style] },
            NvimTreeEndOfBuffer = { bg = tree_bg[style] },
        },
    }
    onedark.load()
end
require('auto-dark-mode').setup({
    set_dark_mode = function() setup('dark') end,
    set_light_mode = function() setup('light') end,
})
EOF

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
lua require 'claudecode_cfg'

set completeopt=menu,menuone,noselect
