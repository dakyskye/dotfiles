let mapleader="\<space>"

map <silent> gf :edit <cfile><cr>

" reselect selected region after indenting
vnoremap < <gv
vnoremap > >gv

nmap <silent> <leader>x :!xdg-open %<cr><cr>
