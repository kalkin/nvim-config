let g:markers = { '{' : '}' , '[' : ']' , '"' : '"', "'" : "'"}
let s:state = {'cur': 'none'}
let s:level = 0

function! IsComment(line) 
    "return l:line =~# '^\s*[#]\{3,}\s*$'
    return a:line =~# '^\s*[#]\+'
endfunction

function! IsMarker(line) 
    "return l:line =~# '^\s*[#]\{3,}\s*$'
    return a:line =~# '[\[\]{}\(\)]'
endfunction

let s:stack = []
function! CountMultipleMarkers(line, markers)
    let l:level = 0
    let l:start_marker_list = keys(a:markers)
    let l:end_marker_list = values(a:markers)

    for l:c in split(a:line, '\zs')
        if count(l:start_marker_list, l:c) > 0 && (len(s:stack) == 0 || s:stack[-1] !=# l:c)
            let l:level += 1
            let l:end_marker = g:markers[l:c]
            let s:stack += [l:end_marker]
        elseif count(l:end_marker_list, l:c) > 0 && s:stack[-1] ==# l:c
            " check if the end_marker is an apropriate one
            let l:level -= 1
            :call remove(s:stack, -1)
        elseif count(l:end_marker_list, l:c) > 0
        else
        endif
    endfor
    return l:level
endfunction

function! CountMarkers(line, start, end)
    let l:level = 0
    for l:c in split(a:line, '\zs')
        if l:c ==# a:start
            let l:level += 1
        elseif l:c ==# a:end
            let l:level -= 1
        endif
    endfor
    return l:level
endfunction

function! PerfectFold(lnum)
    let l:line  = getline(a:lnum)
    let l:level = s:level

    if IsComment(l:line)
        let l:next_line = getline(a:lnum+1)
        let l:next = IsComment(l:next_line)
        if s:state['cur'] ==# 'comment' && l:next 
                return s:level
        elseif s:state['cur'] ==# 'comment' && !l:next
                let l:end_level = s:level
                let s:level -= 1
                return '<'.l:end_level
        elseif l:next
            let s:level +=1
            let s:state['cur'] = 'comment'
            return s:level
        else
            " Previous line is not a comment, Next either
            return s:level
        endif
    else
        let s:level += CountMultipleMarkers(l:line, g:markers)
        let s:state['cur'] = 'marker'
    endif

    if s:level < l:level
        return '<'.s:level +1
    else
        return s:level
    endif
endfunction

set foldmethod=expr
set foldexpr=PerfectFold(v:lnum)

function! CleanLine(line)
    return a:line
endfunction

function! ShellFold() 
  let l:line = CleanLine(getline(v:foldstart))
  if l:line =~# '^\s*#\+\s*$' " when line only consist of comments skip it
    let l:line = CleanLine(getline(v:foldstart + 1))
  endif
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = printf('%3s 🖹', lines_count)
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . l:line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, &tw - foldtextlength+1) . foldtextend
endfunction
"set foldtext=ShellFold()
