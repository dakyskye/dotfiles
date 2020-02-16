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

set nu

colorscheme nord

" make delete to write to the blackhole register
nnoremap d "_d
nnoremap dd "_dd
vnoremap d "_d

" switch between next and previous opened buffers
map <A-Right> :bnext <CR>
map <A-Left> :bprevious <CR>

" clear the highlights after search
nnoremap <leader><space> :nohlsearch<CR>


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

