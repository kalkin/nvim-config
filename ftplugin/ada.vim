let b:did_ftplugin = 1
if !exists('*FindBody')
   function! FindBody()
      function! FindGprIn(dir)
         let files = split(globpath(a:dir, '*.gpr'))
         if len(files) == 0 && a:dir ==# '/'
            return
         elseif len(files) == 0
            return FindGprIn(fnamemodify(a:dir, ':h'))
         else
            return files[0]
         endif
      endfunction

      function! SanitizeResult(result, needle)
         for l:line in split(a:result, '\n')
            if l:line =~ '^'.a:needle
               return l:line
            endif
         endfor
         return
      endfunction

      let word = expand('<cword>')
      let needle = l:word .':' . expand('%'). ':' . line('.')
      let abs_filepath = fnamemodify(expand('%'), ':p')
      let gpr = FindGprIn(fnamemodify(abs_filepath, ':h'))
      if l:gpr ==# ''
         echohl WarningMsg| echo 'No gpr file found'
         return
      endif
      let smth = system('gnatinspect -P' . gpr .' -c"body '. needle .'"')
      let result = SanitizeResult(smth, word)
      if l:result ==# ''
         let result = SanitizeResult(system('gnatinspect -P' . gpr .' -c"decl '. needle .'"'), word)
      endif
      if l:result ==# ''
         echohl WarningMsg| echo ' ' . l:word .' not found'
         return
      endif
      let parts = split(result, ':')
      execute 'edit' '+'.parts[2] parts[1]
      call cursor(parts[2], parts[3])
   endfunction
endif

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
nmap <buffer> <silent> <leader><Return> :ALEFix gnatpp<CR>

map <buffer> <silent> <C-]> :call FindBody()<CR>

set textwidth=120
