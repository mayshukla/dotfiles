" ~/.vimrc

" Syntax and colorscheme " {{{

syntax enable
set background=dark
colorscheme solarized

" }}}
" Line numbers " {{{

"Enable line numbers by default
set number

" }}}
" Tabs "{{{

set expandtab
set shiftwidth=2
set softtabstop=4

"Use 2 spaces for HTML
autocmd BufNewFile,BufRead *.html set softtabstop=2

"Use real tabs for makefiles
"matches anything called 'makefile', case insensitive
autocmd BufNewFile,BufREad \cmakefile set noexpandtab

" }}}
" Folding "{{{

"Automatically folds where there's three consecutive curly braces
set foldmethod=marker

" }}}
" Airline "{{{

" lowered the width at which the git branch section ('b') truncates
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 45,
    \ 'x': 60,
    \ 'y': 88,
    \ 'z': 45,
    \ 'warning': 80,
    \ 'error': 80,
    \ }

" }}}
