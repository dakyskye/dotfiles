local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', '--depth', '1', install_path})
	vim.cmd 'packadd packer.nvim'
end

require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use 'neovim/nvim-lspconfig'

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'

	use 'editorconfig/editorconfig-vim'

	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}

	use 'kdheepak/vim-one'
	--use 'navarasu/onedark.nvim'

	use {
		'hoob3rt/lualine.nvim',
		requires = 'kyazdani42/nvim-web-devicons'
	}

	use 'junegunn/goyo.vim'
	use 'junegunn/limelight.vim'

	use 'ryanoasis/vim-devicons'
	use 'kyazdani42/nvim-web-devicons'
end)

require'nvim-treesitter.configs'.setup {
	ensure_installed = 'all',

	highlight = {
		enable = true
	}
}

vim.g.one_allow_italics = 1
vim.cmd 'colorscheme one'

--BEGIN:THEME
--DARK
vim.o.background = 'dark'

require'lualine'.setup {
options = { theme = 'onedark' },

extensions = { 'fzf', 'nvim-tree' }
}

--LIGHT
--vim.o.background = 'light'

--require'lualine'.setup {
--options = { theme = 'onelight' },

--extensions = { 'fzf', 'nvim-tree' }
--}
--END:THEME

require'nvim-web-devicons'.setup {
	default = true;
}

require'lspconfig'.bashls.setup{}
require'lspconfig'.pyright.setup{}

