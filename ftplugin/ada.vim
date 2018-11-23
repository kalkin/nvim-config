set shiftwidth=3
set tabstop=3
set expandtab
set softtabstop=3
set foldmethod=indent

let b:ale_linters = ['gcc']
function! Beautify()
   let g:lastL = line('.')
   let g:lastC = col('.')
   write
   :silent! exec system('gnat pretty --insert-blank-lines --based-grouping=2 --par_threshold=3 --call_threshold=3 --decimal-grouping=3 -c3 -c4 -W8 -rnb ' . bufname('%') . ' -cargs -gnatW8')
endfunction

nmap <buffer> <silent> <leader><Return> :call Beautify()<CR>:e<CR>:set ft=ada<CR>:call cursor(g:lastL, g:lastC)<CR>

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'start'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
let g:NERDAltDelims_ada = 1
