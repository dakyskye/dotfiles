execute pathogen#infect()

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

syntax on

set noswapfile
set nobackup
set nowritebackup

set exrc
set secure

set encoding=utf-8

set clipboard=unnamedplus
set mouse=a
set cursorline

set splitbelow splitright

set autoindent
set tabstop=4
set ignorecase
set smartcase

set incsearch
set hlsearch

set hidden

set cmdheight=2
set updatetime=300
set shortmess+=c

set noshowmode

set nu

colorscheme nord

set t_Co=256

" make delete to write to the blackhole register
nnoremap d "_d
nnoremap dd "_dd
nnoremap x "_x
vnoremap d "_d

" switch between next and previous opened buffers
map <A-Right> :bnext <CR>
map <A-Left> :bprevious <CR>

" clear the highlights after search
nnoremap <leader><space> :nohlsearch<CR>


" NERDTree config
nmap <F6> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowLineNumbers= 1
let NERDTreeShowHidden= 1
let NERDTreeMinimalUI = 1

" vim-airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='violet'

" tagbar config
nmap <F8> :TagbarToggle<CR>

" https://github.com/jstemmer/gotags
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

