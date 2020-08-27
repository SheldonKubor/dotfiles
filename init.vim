set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" let g:python3_host_prog = '/Users/mjh/opt/miniconda3/envs/neovim/bin/python'
let g:python3_host_prog = $PHTHON_PATH
set termguicolors
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
source ~/.vimrc
