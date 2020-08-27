let mapleader=" "
set number
set cursorline
set tabstop=4
set ignorecase
set smartcase
set laststatus=2
set hlsearch

inoremap jj <Esc>
inoremap ZZ <Esc>:wq<CR>
inoremap zz <Esc>:w<CR>
inoremap qq <Esc>:q!<CR>

nnoremap < <<
nnoremap > >>
nnoremap qq <Esc>:q!<CR>
nnoremap ; 0
nnoremap ' $
nnoremap <LEADER>w <C-w>w
nnoremap <LEADER>k <C-w>k
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER>h <C-w>h
nnoremap <LEADER>l <C-w>l
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-bufferline'
call plug#end()
syntax enable
set background=dark
colorscheme solarized
highlight Pmenu    guibg=darkgrey  guifg=black 
highlight PmenuSel guibg=lightgrey guifg=black
let g:coc_disable_startup_warning = 1
" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc
nmap <space>e :CocCommand explorer<CR>
