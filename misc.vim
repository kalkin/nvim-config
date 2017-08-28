" vim: fmr={{{,}}} fdm=marker tw=80 ft=vim
"
" Information {{{
" This file contains all configurations which doesn't fit elsewhere
" }}}

" Syntax on!
syntax on

" Filetype plugin on!
filetype plugin on

set termguicolors
colorscheme NeoSolarized

let g:mapleader=' '

" Needed for loading own snippets and not the snipmate snippets
let g:snippets_dir='~/.vim/snippets'


set foldtext=NeatFoldText()

let g:undotree_SplitWidth = 40
let g:undotree_SetFocusWhenToggle = 1

augroup HiglightTODO
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(WORKAROUND\|CHANGED\|XXX\|FIXME\|BUG:\|HACK\)')
augroup END
