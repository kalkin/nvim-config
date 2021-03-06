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

let b:ale_enabled = 1
let b:ale_linters = ['gcc']
let b:ale_ada_gnatpp_options = '--insert-blank-lines --based-grouping=4 --par_threshold=3 --call_threshold=3 --decimal-grouping=3 --preserve-blank-lines --comments-unchanged --max-line-length=120'
let b:ale_ada_gcc_options = '-gnatwa -gnatq -gnatX -gnatW8'
let b:ale_ada_gcc_executable= $HOME . '/opt/GNAT/2019/bin/gcc'
let b:gnatinspect_executable= $HOME . '/opt/GNAT/2019/bin/gnatinspect'
let b:ale_ada_gnatpp_executable= $HOME . '/opt/GNAT/2019/bin/gnatpp'
nmap <buffer> <silent> <leader><Return> :ALEFix gnatpp<CR>

map <buffer> <silent> <C-]> :call ft#ada#GnatGotoTag()<CR>
map <buffer> <silent> gd :call ft#ada#GnatGotoDeclaration()<CR>

set textwidth=120
