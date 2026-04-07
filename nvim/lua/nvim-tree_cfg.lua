require("nvim-tree").setup({
	filters = {
		dotfiles = false,
	}
})

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
