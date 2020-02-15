execute pathogen#infect()

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
set tabstop=4
set encoding=utf-8
set t_Co=256
set autoindent
set incsearch
set noswapfile
set nobackup
set nowritebackup
set ignorecase
set smartcase
set lazyredraw
set splitbelow splitright
syntax on
set nu
colorscheme nord
set exrc
set secure
set clipboard=unnamedplus " requires gvim
set mouse=a
set hlsearch
set cursorline

" make delete to write to the blackhole register
nnoremap d "_d
nnoremap dd "_dd
vnoremap d "_d

" switch between next and previous opened buffers
map <A-Right> :bnext <CR>
map <A-Left> :bprevious <CR>

" clear the highlights after search
nnoremap <leader><space> :nohlsearch<CR>

" Tagbar config
map <F8> :TagbarToggle<CR>
" https://github.com/jstemmer/gotags#vim-tagbar-configuration
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" YouCompleteMe config
let g:ycm_autoclose_preview_window_after_completion = 1

" NERDTree config
map <F6> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers= 1
let NERDTreeShowHidden= 1
let NERDTreeMinimalUI = 1

" vim-go config
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_auto_sameids = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='violet'

" vim-prettier config
let g:prettier#autoformat_config_present = 1
