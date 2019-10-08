function! s:FindGprIn(dir)
    let files = split(globpath(a:dir, '*.gpr'))
    if len(files) == 0 && a:dir ==# '/'
        return
    elseif len(files) == 0
        return FindGprIn(fnamemodify(a:dir, ':h'))
    else
        return files[0]
    endif
endfunction

function! s:SanitizeResult(input, needle)
    let l:result = []
    for l:line in split(a:input, '\n')
        if l:line =~ '^'.a:needle
            call add(l:result, l:line)
        endif
    endfor
    return l:result
endfunction

function! s:GnatInspect(gpr, cmd, name, file, line)
    let l:needle = a:name .':' . a:file. ':' . a:line
    let l:output = system('gnatinspect -P' . a:gpr .' -c"' . a:cmd . ' '. l:needle .'"')
    let l:result = s:SanitizeResult(l:output, a:name)
    if l:result == []
        throw a:name . ' not found'
    endif
    return l:result
endfunction

" Handle bug in gnatinspect with separate body
function s:AdjustLineNumber(file)
    if a:file =~? '.*\.ads$'
        return 0
    endif
    let l:result = 0
    let l:isSeparate = 0
    for l:line in readfile(a:file)
        if l:line =~? '^\s*\(package\|function\|procedure\)'
            break
        elseif l:line =~? '^\s*separate'
            let l:isSeparate = 1
        endif
        let l:result = l:result + 1
    endfor
    if l:isSeparate == 1
        return l:result - 1
    endif
    return 0
endfunction

function! ft#ada#GnatGotoTag()
    let l:abs_filepath = fnamemodify(expand('%'), ':p')
    try
        let l:gpr = s:FindGprIn(fnamemodify(l:abs_filepath, ':h'))
    catch
        echohl WarningMsg| echo v:exception
    endtry
    let l:word = expand('<cword>')
    try
        let l:result = s:GnatInspect(l:gpr, 'body', l:word, expand('%'), line('.'))
    catch /.\+ not found/
        try
            let l:result = s:GnatInspect(l:gpr, 'decl', l:word, expand('%'), line('.'))
        catch /.\+ not found/
            echohl WarningMsg| echo v:exception
            return
        endtry
    endtry
    let parts = split(result[0], ':')
    let l:file = l:parts[1]
    let l:line = l:parts[2]
    let l:line = l:line + s:AdjustLineNumber(l:file)
    let l:column = l:parts[3]
    execute 'edit' '+'.line file
    call cursor(l:line, l:column)
endfunction

