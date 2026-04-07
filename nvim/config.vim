let mapleader="\<space>"

map <silent> <leader>gf :edit <cfile><cr>

function! ToggleHighlight()
    if !&hlsearch
        set hlsearch
    else
        set nohlsearch
    endif
endfunction

nnoremap <silent> <esc><esc> :call ToggleHighlight()<CR>

" reselect selected region after indenting
vnoremap < <gv
vnoremap > >gv

" splits (tmux-style keys)
nnoremap <C-w>% <C-w>v
nnoremap <C-w>" <C-w>s

" resize splits (mirrors tmux M-hjkl)
nnoremap <M-h> <C-w><
nnoremap <M-l> <C-w>>
nnoremap <M-j> <C-w>-
nnoremap <M-k> <C-w>+

" buffer navigation
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>

nmap <silent> <leader>x :!open %<cr><cr>

" deleted stuff, BEGONE!
" ChatGPT generated + my additions

" Delete character under cursor
nnoremap x "_x

" Delete word under cursor
nnoremap dw "_dw
nnoremap cw "_cw

" Delete current line
nnoremap dd "_dd
nnoremap cc "_cc

" Delete inner word (cursor on any character of the word)
nnoremap diw "_diw
nnoremap ciw "_ciw

" Delete entire word (includes surrounding whitespace)
nnoremap daw "_daw
nnoremap caw "_caw

" Delete from cursor to end of line
nnoremap D "_D
nnoremap C "_C

" Delete visual selecion
vnoremap d "_d
vnoremap c "_c
vnoremap D "_D
vnoremap C "_C

" Delete from cursor to end of word
nnoremap de "_de
nnoremap ce "_ce

" Delete from cursor to beginning of line
nnoremap d0 "_d0
nnoremap c0 "_c0

" Delete from cursor to beginning of word
nnoremap db "_db
nnoremap cb "_cb

" Delete inside parentheses
nnoremap di( "_di(
nnoremap ci( "_ci(

" Delete inside brackets
nnoremap di[ "_di[
nnoremap ci[ "_ci[

" Delete inside braces
nnoremap di{ "_di{
nnoremap ci{ "_ci{

" Delete inside quotes (single or double)
nnoremap di' "_di'
nnoremap ci' "_ci'
nnoremap di" "_di"
nnoremap ci" "_ci"

