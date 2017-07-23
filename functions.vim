" vim: tw=80 ft=vim

" My Custom foldtext() implementation
" original source https://www.linux.com/learn/tutorials/442438-vim-tips-folding-fun
function! NeatFoldText()
    let l:line = substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g')
    let l:lines_count = v:foldend - v:foldstart + 1
    let l:lines_count_text = '|' . printf('%3s lines', l:lines_count) . '|'
    let l:foldchar = matchstr(&fillchars, 'fold:\zs.')
    let l:foldtextstart = strpart('+' . repeat(l:foldchar, v:foldlevel*2) . l:line, 0, (winwidth(0)*2)/3)
    let l:foldtextlength = strlen(substitute(l:foldtextstart . l:lines_count_text, '.', 'x', 'g')) + &foldcolumn
    return l:foldtextstart . repeat(l:foldchar, 80-l:foldtextlength) . l:lines_count_text
endfunction

