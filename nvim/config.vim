let mapleader="\<space>"

map <silent> gf :edit <cfile><cr>

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

" Delete current line
nnoremap dd "_dd

" Delete inner word (cursor on any character of the word)
nnoremap diw "_diw

" Delete entire word (includes surrounding whitespace)
nnoremap daw "_daw

" Delete from cursor to end of line
nnoremap D "_D

" Delete visual selecion
vnoremap d "_d
vnoremap D "_D

" Delete from cursor to end of word
nnoremap de "_de

" Delete from cursor to beginning of line
nnoremap d0 "_d0

" Delete from cursor to beginning of word
nnoremap db "_db

" Delete inside parentheses
nnoremap di( "_di(

" Delete inside brackets
nnoremap di[ "_di[

" Delete inside braces
nnoremap di{ "_di{

" Delete inside quotes (single or double)
nnoremap di' "_di'
nnoremap di" "_di"

" Delete to the next occurrence of a character
nnoremap dt<char> "_dt<char>
