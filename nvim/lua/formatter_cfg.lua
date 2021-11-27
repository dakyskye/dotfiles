require'formatter'.setup {
	filetype = {
		go = {
			function()
				return {
					exe = "gofumpt",
					args = { '-w' },
					stdin = false,
				}
			end
		},
		python = {
			function()
				return {
					exe = "black",
					args = { '-' },
					stdin = true,
				}
			end
		},
	}
}
