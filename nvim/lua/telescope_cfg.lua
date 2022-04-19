local actions = require'telescope.actions'

require'telescope'.setup{
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
		file_ignore_patterns = { ".git/" }
	},
}
