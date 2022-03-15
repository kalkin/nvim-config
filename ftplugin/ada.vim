let b:did_ftplugin = 1

set shiftwidth=3
set tabstop=3
set expandtab
set softtabstop=3
set foldmethod=indent


" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'start'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
let g:NERDAltDelims_ada = 1

setlocal foldlevel=1
setlocal textwidth=120
setlocal foldignore=--

highlight adaInc gui=bold ctermfg=9 guifg=#cb4b16
highlight adaStorageClass gui=bold ctermfg=2 guifg=#719e07

augroup AnyFold
   autocmd Filetype ada AnyFoldActivate
augroup End
