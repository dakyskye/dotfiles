if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	:qa!
endif

call plug#begin('~/.config/nvim/bundle')
"""

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

nnoremap <c-p> :Files<cr>
nnoremap <c-g> :GFiles<cr>
nnoremap <c-f> :Rg!

" Floaterm
Plug 'voldikss/vim-floaterm'

" Polyglot
Plug 'sheerun/vim-polyglot'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'

" OneDark
Plug 'joshdick/onedark.vim'

let g:onedark_terminal_italics = 1

" Devicons
Plug 'ryanoasis/vim-devicons'

" Go
Plug 'fatih/vim-go'

let g:go_gopls_enabled = 0
let g:go_def_mapping_enabled = 0

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions =
	\ [
	\ 'coc-go',
	\ 'coc-sql',
	\ 'coc-vimlsp',
	\ 'coc-markdownlint',
	\ 'coc-json',
	\ 'coc-toml',
	\ 'coc-yaml',
	\ 'coc-highlight',
	\ 'coc-fzf-preview',
	\ 'coc-floaterm',
	\ 'coc-explorer',
	\ 'coc-snippets',
	\ 'coc-pairs'
	\ ]

" use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <tab>
	\ pumvisible() ? "\<c-n>" :
	\ <sid>check_back_space() ? "\<tab>" :
	\ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" make <cr> auto-select the first completion item and notify coc.nvim to format on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
						\: "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

" GoTo code navigation.
nmap <silent>gd <plug>(coc-definition)
nmap <silent>gy <plug>(coc-type-definition)
nmap <silent>gi <plug>(coc-implementation)
nmap <silent>gr <plug>(coc-references)

" use `[g` and `]g` to navigate diagnostics
nmap <silent>[g <plug>(coc-diagnostic-prev)
nmap <silent>]g <plug>(coc-diagnostic-next)

" use K to show documentation in preview window
nnoremap <silent> K :call <sid>show_documentation()<cr>

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
nmap <leader>rn <plug>(coc-rename)

" show all diagnostics.
nnoremap <silent><a-6> :<c-u>CocList diagnostics<cr>

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

" keys

" clear search results
nnoremap <leader><space> :nohlsearch<cr>

" open explorer
nnoremap <silent><a-1> :CocCommand explorer<cr>

" open floaterm
nnoremap <silent><a-3> :FloatermToggle<cr>

" open git actions
nnoremap <silent><a-9> :FzfPreviewGitActionsRpc<cr>

" open list of git commits
nnoremap <silent><a-0> :Commits<cr>

" open list of buffers
nnoremap <silent><a-tab> :FzfPreviewAllBuffersRpc<cr>

" resizing buggers
nnoremap <silent><c-up> :vertical resize +5<cr>
nnoremap <silent><c-down> :vertical resize -5<cr>
nnoremap <silent><c-right> :resize +5<cr>
nnoremap <silent><c-left> :resize -5<cr>

"""
