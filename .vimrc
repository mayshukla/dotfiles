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

"Display existing tabs as 4 spaces
set tabstop=4
"When press the tab key, insert 4 spaces
set expandtab

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
