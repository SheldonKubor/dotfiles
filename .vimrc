set syntax=on
set number

inoremap jj <Esc>
inoremap ZZ <Esc>:wq<CR>
inoremap zz <Esc>:w<CR>

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
call plug#end()
