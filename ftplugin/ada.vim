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
let b:ale_linters = []
let b:ale_ada_gcc_executable= $HOME . '/opt/GNAT/2020/bin/gcc'
let b:gnatinspect_executable= $HOME . '/opt/GNAT/2020/bin/gnatinspect'
nmap <buffer> <silent> <leader><Return> :ALEFix gnatpp<CR>

function! s:FindGprIn(dir)
    let files = split(globpath(a:dir, '*.gpr'))
    if len(files) == 0 && a:dir ==# '/'
        return
    elseif len(files) == 0
        return s:FindGprIn(fnamemodify(a:dir, ':h'))
    else
        return files[0]
    endif
endfunction

let b:abs_filepath = fnamemodify(expand('%'), ':p')
let b:ale_ada_gnatpp_options = '-P ' . s:FindGprIn(fnamemodify(b:abs_filepath, ':h'))

let g:LanguageClient_serverCommands = {
    \ 'ada': [$HOME . '/bin/adals'],
    \ }

set textwidth=120
