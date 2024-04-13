require("nvim-tree").setup({
	filters = {
		dotfiles = true,
	}
})

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
