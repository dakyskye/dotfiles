require'gitsigns'.setup {
	signcolumn = true,
	numhl = true,
	word_diff = true,
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "right_align",
		delay = 0,
	},
}
