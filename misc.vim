" vim: fmr={{{,}}} fdm=marker tw=80 ft=vim
"
" Information {{{
" This file contains all configurations which doesn't fit elsewhere
" }}}

" Syntax on!

" Filetype plugin on!
filetype plugin on

let g:mapleader=' '

augroup HiglightTODO
    autocmd Syntax * call matchadd('Todo',  '\(^\s*\|\s+\)\(WORKAROUND\|CHANGED\|XXX\|FIXME\|BUG:\|HACK\)\(\s*$\|\s+\)')
augroup END
