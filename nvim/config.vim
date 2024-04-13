let mapleader="\<space>"

map <silent> <leader>gf :edit <cfile><cr>

" reselect selected region after indenting
vnoremap < <gv
vnoremap > >gv

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

" Delete to the next occurrence of a character
nnoremap dt<char> "_dt<char>
nnoremap ct<char> "_ct<char>
