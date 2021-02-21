if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	:qa!
endif

call plug#begin('~/.config/nvim/bundle')
"""

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions =
	\ [
	\ 'coc-go',
	\ 'coc-tsserver',
	\ 'coc-snippets',
	\ 'coc-toml',
	\ 'coc-yaml',
	\ 'coc-highlight'
	\ ]

" use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" make <CR> auto-select the first completion item and notify coc.nvim to format on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
						\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" use `[g` and `]g` to navigate diagnostics
" use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>]g <Plug>(coc-diagnostic-next)

" use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" show all diagnostics.
nnoremap <silent><space>a  :<C-u>CocList diagnostics<cr>

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" FZF for file browsing
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

nnoremap <C-p> :Files<cr>
nnoremap <C-g> :GFiles<cr>
nnoremap <C-f> :Rg!

" Polyglot to syntax highlight for most languages
Plug 'sheerun/vim-polyglot'

" Airline for fancy status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='onedark'

" OneDark theme
Plug 'joshdick/onedark.vim'

let g:onedark_terminal_italics=1

"""
call plug#end()

" config
"""

set syntax=on
set noswapfile
set nobackup
set nowritebackup
set confirm
set autoread
set lazyredraw
set exrc
set secure
set encoding=utf-8
set clipboard=unnamedplus
set mouse=a
set cursorline
set splitbelow splitright
set autoindent
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set incsearch
set hlsearch
set hidden
set cmdheight=1
set updatetime=100
set shortmess+=c
set signcolumn=yes
set noshowmode
set number relativenumber
set t_Co=256
set termguicolors
colorscheme onedark

" clear search results
nnoremap <leader><space> :nohlsearch<cr>

"""
