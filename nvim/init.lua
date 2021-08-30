vim.g.mapleader=" "

vim.opt.syntax = 'enable'
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.confirm = true
vim.opt.autoread = true
vim.opt.lazyredraw = true
vim.opt.iskeyword = vim.opt.iskeyword + { '-' }
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.encoding = 'utf-8'
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.updatetime = 100
vim.opt.timeoutlen = 500
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.opt.signcolumn = 'number'
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

if not vim.g.vscode then
	require 'config'
end

