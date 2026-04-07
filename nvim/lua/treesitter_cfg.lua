vim.filetype.add({
	extension = { j2 = 'jinja' },
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})
