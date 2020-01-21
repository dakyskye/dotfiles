execute pathogen#infect()

filetype plugin indent on
set tabstop=4
syntax on
set nu
colorscheme nord
set exrc
set secure

" start NERDTree automatically when opening vim with no arguments, or opening
" a folder with vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" close Vim if the only open window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open NERDTree with F6
map <F6> :NERDTreeToggle<CR>

" make vim-go use gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
