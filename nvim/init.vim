source ~/.config/nvim/shared.vim

if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	:qa!
endif

call plug#begin('~/.config/nvim/plugged')

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'
" EditorConfig
Plug 'editorconfig/editorconfig-vim'
" NERDCommenter
Plug 'preservim/nerdcommenter'
" Which
Plug 'liuchengxu/vim-which-key'
" FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
" Maximizer
Plug 'szw/vim-maximizer'
" Surround
Plug 'tpope/vim-surround'
" Floaterm
Plug 'voldikss/vim-floaterm'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSInstall all' }
" One
Plug 'kdheepak/vim-one'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Devicons
Plug 'ryanoasis/vim-devicons'
" Goyo
Plug 'junegunn/goyo.vim'
" Limelight
Plug 'junegunn/limelight.vim'
" Go
Plug 'fatih/vim-go'
" Vimspector
Plug 'puremourning/vimspector'
" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"""
call plug#end()

" config
"""

set guifont=JetBrainsMono\ Nerd\ Font:h12
set background=dark
colorscheme one

" treesitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" one
let g:one_allow_italics = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'one'

" signify
let g:signify_sign_show_count = 0
let g:signify_sign_add = "▎"
let g:signify_sign_delete = "▏"
let g:signify_sign_delete_first_line = "▔"
let g:signify_sign_change = "▎"
let g:signify_sign_change_delete = "▋"

" nerdcommenter
let g:NERDCreateDefaultMappings = 1

" vim-go
let g:go_gopls_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
"
" vimspector
let g:vimspector_enable_mappings = 'vscode'
let g:vimspector_install_gadgets = [ 'vscode-go' ]

" which
let g:which_key_centered = 0
let g:which_key_use_floating_win = 0

call which_key#register('<Space>', "g:which_key_map")
let g:which_key_map = {}

let g:which_key_map.c = { 'name': '+comment'}

" which
nnoremap <silent><leader> :silent WhichKey '<space>'<cr>

" clear search results
nnoremap <silent><leader><bs> :nohlsearch<cr>

" coc
let g:coc_global_extensions =
	\ [
	\ 'coc-go',
	\ 'coc-diagnostic',
	\ 'coc-json',
	\ 'coc-toml',
	\ 'coc-highlight',
	\ 'coc-floaterm',
	\ 'coc-explorer',
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-prettier'
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

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" goto
nmap <silent><leader>lgd <plug>(coc-definition)
nmap <silent><leader>lgy <plug>(coc-type-definition)
nmap <silent><leader>lgi <plug>(coc-implementation)
nmap <silent><leader>lgr <plug>(coc-references)
" diagnostics
nnoremap <silent><leader>lda :<c-u>CocList diagnostics<cr>
nnoremap <silent><leader>ldp <plug>(coc-diagnostic-prev)
nnoremap <silent><leader>ldn <plug>(coc-diagnostic-next)
" code
nnoremap <silent><leader>lca :CocAction<cr>
nnoremap <silent><leader>lcd :call <sid>show_documentation()<cr>
nnoremap <silent><leader>lcr <plug>(coc-rename)

let g:which_key_map.l = { 'name': '+lsp' }
let g:which_key_map.l.d = { 'name': '+diagnostics' }
let g:which_key_map.l.d.a = 'all diagnostics'
let g:which_key_map.l.d.n = 'next diagnostic'
let g:which_key_map.l.d.p = 'previous diagnostic'

let g:which_key_map.l.g = { 'name': '+goto' }
let g:which_key_map.l.g.d = 'definition'
let g:which_key_map.l.g.y = 'type definition'
let g:which_key_map.l.g.i = 'implementation'
let g:which_key_map.l.g.r = 'references'

let g:which_key_map.l.c = { 'name': '+code' }
let g:which_key_map.l.c.a = 'actions'
let g:which_key_map.l.c.d = 'documentation'
let g:which_key_map.l.c.r = 'rename symbol'


nnoremap <silent><leader>bl :Buffers<cr>
nnoremap <silent><leader>bm :MaximizerToggle<cr>
nnoremap <silent><leader>bc :bd<cr>

nnoremap <silent><leader>bnk <c-w>k
nnoremap <silent><leader>bnj <c-w>j
nnoremap <silent><leader>bnl <c-w>l
nnoremap <silent><leader>bnh <c-w>h

nnoremap <leader>brvf :resize +8
nnoremap <leader>brvb :resize -8
nnoremap <leader>brhf :vertical resize +10
nnoremap <leader>brhb :vertical resize -10

let g:which_key_map.b = { 'name': '+buffer' }
let g:which_key_map.b.l = 'list'
let g:which_key_map.b.m = 'toggle maximizer'
let g:which_key_map.b.c = 'close buffer'

let g:which_key_map.b.n = { 'name': '+navigate' }
let g:which_key_map.b.n.l = 'right'
let g:which_key_map.b.n.h = 'left'
let g:which_key_map.b.n.k = 'up'
let g:which_key_map.b.n.j = 'down'

let g:which_key_map.b.r = { 'name': '+resize' }

let g:which_key_map.b.r.v =  { 'name': '+vertical' }
let g:which_key_map.b.r.v.f = 'forward'
let g:which_key_map.b.r.v.b = 'backwards'

let g:which_key_map.b.r.h = { 'name': '+horizontal' }
let g:which_key_map.b.r.h.f = 'forward'
let g:which_key_map.b.r.h.b = 'backwards'


nnoremap <silent><leader>fa :Files<cr>
nnoremap <silent><leader>fg :GFiles<cr>
nnoremap <leader>fr :Rg!

let g:which_key_map.f = { 'name': '+file' }
let g:which_key_map.f.a = 'all'
let g:which_key_map.f.g = 'git'
let g:which_key_map.f.r = 'ripgrep'

" open explorer
nnoremap <silent><leader>oe :CocCommand explorer<cr>
" open floaterm
nnoremap <silent><leader>ott :FloatermToggle<cr>
nnoremap <silent><leader>ots :FloatermShow<cr>
nnoremap <silent><leader>otn :FloatermNew<cr>
nnoremap <silent><leader>otu :FloatermUpdate<cr>
" open command pallete
nnoremap <silent><leader>oc :FzfPreviewCommandPaletteRpc<cr>

let g:which_key_map.o = { 'name': '+open' }
let g:which_key_map.o.e = 'explorer'
let g:which_key_map.o.c = 'command palette'

let g:which_key_map.o.t = { 'name': '+terminal' }
let g:which_key_map.o.t.t = 'toggle'
let g:which_key_map.o.t.s = 'show'
let g:which_key_map.o.t.n = 'new'
let g:which_key_map.o.t.u = 'update'

nnoremap <silent><leader>gi :LazyGit<cr>
nnoremap <silent><leader>gg :SignifyToggle<cr>

nnoremap <silent><leader>glc :FzfPreviewGitLogsRpc<cr>
nnoremap <silent><leader>glb :FzfPreviewGitBranchesRpc<cr>
nnoremap <silent><leader>glr :FzfPreviewGitReflogsRpc<cr>
nnoremap <silent><leader>gls :FzfPreviewGitStashesRpc<cr>

let g:which_key_map.g = { 'name': '+git' }
let g:which_key_map.g.g = 'toggle gutter'
let g:which_key_map.g.i = 'ui interface'

let g:which_key_map.g.l = { 'name': '+list' }
let g:which_key_map.g.l.r = 'reflogs'
let g:which_key_map.g.l.c = 'commits'
let g:which_key_map.g.l.b = 'branches'
let g:which_key_map.g.l.s = 'stashes'

nnoremap <silent><leader>eg :Goyo<cr>
nnoremap <silent><leader>el :Limelight!!<cr>

let g:which_key_map.e = { 'name': '+editor' }
let g:which_key_map.e.g = 'goyo'
let g:which_key_map.e.l = 'limelight'

nnoremap <silent><leader>etd :call <sid>changeTheme('dark')<cr>
nnoremap <silent><leader>etl :call <sid>changeTheme('light')<cr>

let g:which_key_map.e.t = { 'name': '+theme' }
let g:which_key_map.e.t.d = 'dark'
let g:which_key_map.e.t.l = 'light'

function! s:changeTheme(theme)
	if a:theme == "dark"
		set background=dark
	else
		set background=light
	endif
	colorscheme one
	exe "normal \<C-l>"
endfunction
