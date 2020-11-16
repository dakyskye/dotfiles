if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	:qa!
endif

call plug#begin('~/.config/nvim/bundle')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'dracula/vim'
Plug 'kovetskiy/sxhkd-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'

call plug#end()

syntax on

set noswapfile
set nobackup
set nowritebackup
set confirm
set autoread
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
set updatetime=300
set shortmess+=c
set signcolumn=yes
set noshowmode
set number relativenumber
set t_Co=256
set termguicolors

colorscheme dracula

vnoremap <Leader>$ $
vnoremap $ g_

nnoremap D "_D
nnoremap diw "_diw
nnoremap <Leader>diw "+diw
nnoremap c <Nop>
vnoremap c "_c
vnoremap <Leader>c "+c
nnoremap dd "_dd
nnoremap <Leader>dd "+dd
nnoremap x "_x
nnoremap <Leader>x "+x
vnoremap d "_d
vnoremap <Leader>d "+d
vnoremap x "_x
vnoremap <Leader>x "+x

" disable arrow keys
"inoremap <Up>        <Nop>
"inoremap <Down>      <Nop>
"inoremap <Left>      <Nop>
"inoremap <Right>     <Nop>
nnoremap <Up>        <Nop>
nnoremap <Down>      <Nop>
nnoremap <Left>      <Nop>
nnoremap <Right>     <Nop>
nnoremap <A-Up>      <Nop>
nnoremap <A-Down>    <Nop>
nnoremap <A-Left>    <Nop>
nnoremap <A-Right>   <Nop>
vnoremap <Up>        <Nop>
vnoremap <Down>      <Nop>
vnoremap <Left>      <Nop>
vnoremap <Right>     <Nop>

" switch between splitted windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" switch between next and previous opened buffers
nmap <A-l> :bnext      <CR>
nmap <A-h> :bprevious  <CR>

" toggle spelling check
" use the real, the original, the English English for spell checking
map <silent><A-s> : set spell! spelllang=en_gb <CR>

" clear the highlights after search
nnoremap <Leader><space> :nohlsearch<CR>

" organise Go code imports (imports unimported, but used packages)
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" fzf.vim
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-f> :Rg!

" vim-airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='violet'

" tagbar config
nmap <silent><F8> :TagbarToggle<CR>

" https://github.com/preservim/tagbar/wiki
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

let g:tagbar_type_rust = {
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }

let g:tagbar_type_typescript = {                                                  
  \ 'ctagsbin' : 'tstags',                                                        
  \ 'ctagsargs' : '-f-',                                                           
  \ 'kinds': [                                                                     
    \ 'e:enums:0:1',                                                               
    \ 'f:function:0:1',                                                            
    \ 't:typealias:0:1',                                                           
    \ 'M:Module:0:1',                                                              
    \ 'I:import:0:1',                                                              
    \ 'i:interface:0:1',                                                           
    \ 'C:class:0:1',                                                               
    \ 'm:method:0:1',                                                              
    \ 'p:property:0:1',                                                            
    \ 'v:variable:0:1',                                                            
    \ 'c:const:0:1',                                                              
  \ ],                                                                            
  \ 'sort' : 0                                                                    
\ }   

let g:tagbar_type_json = {
    \ 'ctagstype' : 'json',
    \ 'kinds' : [
      \ 'o:objects',
      \ 'a:arrays',
      \ 'n:numbers',
      \ 's:strings',
      \ 'b:booleans',
      \ 'z:nulls'
    \ ],
  \ 'sro' : '.',
    \ 'scope2kind': {
    \ 'object': 'o',
      \ 'array': 'a',
      \ 'number': 'n',
      \ 'string': 's',
      \ 'boolean': 'b',
      \ 'null': 'z'
    \ },
    \ 'kind2scope': {
    \ 'o': 'object',
      \ 'a': 'array',
      \ 'n': 'number',
      \ 's': 'string',
      \ 'b': 'boolean',
      \ 'z': 'null'
    \ },
    \ 'sort' : 0
\ }

" coc configuration
" coc packages
let g:coc_global_extensions = [
	\ 'coc-go',
	\ 'coc-tsserver',
	\ 'coc-python',
	\ 'coc-rust-analyzer',
	\ 'coc-clangd',
	\ 'coc-json',
	\ 'coc-markdownlint',
	\ 'coc-html',
	\ 'coc-css',
	\ 'coc-xml',
	\ 'coc-git',
	\ 'coc-snippets',
	\ 'coc-prettier',
	\ 'coc-highlight',
	\ 'coc-pairs'
\ ]

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Symbol renaming.
nmap <Leader>rn <Plug>(coc-rename)

" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
