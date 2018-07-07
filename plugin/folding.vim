
set foldmethod=marker
set foldmarker={,}
set foldlevel=1
set foldcolumn=0    " Hide the fold level indicator column

" Specifies for which type of commands folds will be openx
" ,--------[ Options ]
" | item    command
" | all     any
" | block   "(", "{", "[[", "[{", etc.
" | hor     horizontal movements: "l", "w", "fx", etc
" | insert  any command in Insert mode
" | jump    far jumps: "G", "gg" etc..
" | mark    jumping to mark
" | percent "%"
" | quickfix ":cn", ":crew", ":make" etc
" | search   search for a pattern "/", "n", "*", "gd"
" | tag     jumping to a tag
" | undo    undo or redo
" `--------
set foldopen=insert,jump,tag,mark,quickfix,search

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

set foldtext=NeatFoldText()     " Use my foldtext() implementation by default

" set foldclose  " When set auto closes folds
