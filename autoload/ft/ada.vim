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
    let l:output = system(b:gnatinspect_executable . ' -P' . a:gpr .' -c"' . a:cmd . ' '. l:needle .'"')
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

" Function : EqualFilePaths (PRIVATE)
" Purpose  : Compares two paths. Do simple string comparison anywhere but on
"            Windows. On Windows take into account that file paths could differ
"            in usage of separators and the fact that case does not matter.
"            "c:\WINDOWS" is the same path as "c:/windows". has("win32unix") Vim
"            version does not count as one having Windows path rules.
" Args     : path1 (IN) -- first path
"            path2 (IN) -- second path
" Returns  : 1 if path1 is equal to path2, 0 otherwise.
" Author   : Ilya Bobir <ilya@po4ta.com>
function! s:EqualFilePaths(path1, path2)
    if has('win16') || has('win32') || has('win64') || has('win95')
        return substitute(a:path1, '\/', '\\', 'g') ==? substitute(a:path2, '\/', '\\', 'g')
    else
        return a:path1 == a:path2
    endif
endfunction

" Function : FindOrCreateBuffer (PRIVATE)
" Purpose  : searches the buffer list (:ls) for the specified filename. If
"            found, checks the window list for the buffer. If the buffer is in
"            an already open window, it switches to the window. If the buffer
"            was not in a window, it switches to that buffer. If the buffer did
"            not exist, it creates it.
" Args     : filename (IN) -- the name of the file
"            doSplit (IN) -- indicates whether the window should be split
"                            ("v", "h", "n", "v!", "h!", "n!", "t", "t!")
"            findSimilar (IN) -- indicate weather existing buffers should be
"                                prefered
" Returns  : nothing
" Author   : Michael Sharpe <feline@irendi.com>
" History  : + bufname() was not working very well with the possibly strange
"            paths that can abound with the search path so updated this
"            slightly.  -- Bindu
"            + updated window switching code to make it more efficient -- Bindu
"            Allow ! to be applied to buffer/split/editing commands for more
"            vim/vi like consistency
"            + implemented fix from Matt Perry
function s:FindOrCreateBuffer(fileName, doSplit, findSimilar)
    " Check to see if the buffer is already open before re-opening it.
    let FILENAME = escape(a:fileName, ' ')
    let bufNr = -1
    let lastBuffer = bufnr('$')
    let i = 1
    if (a:findSimilar)
        while i <= lastBuffer
            if s:EqualFilePaths(expand('#'.i.':p'), a:fileName)
                let bufNr = i
                break
            endif
            let i = i + 1
        endwhile

        if (bufNr == -1)
            let bufName = bufname(a:fileName)
            let bufFilename = fnamemodify(a:fileName,':t')

            if (bufName ==# '')
                let bufName = bufname(bufFilename)
            endif

            if (bufName !=# '')
                let tail = fnamemodify(bufName, ':t')
                if (tail !=# bufFilename)
                    let bufName = ''
                endif
            endif
            if (bufName !=# '')
                let bufNr = bufnr(bufName)
                let FILENAME = bufName
            endif
        endif
    endif

    let splitType = a:doSplit[0]
    let bang = a:doSplit[1]
    if (bufNr == -1)
        " Buffer did not exist....create it
        let v:errmsg=''
        if (splitType ==# 'h')
            silent! execute ':split'.bang.' ' . FILENAME
        elseif (splitType ==# 'v')
            silent! execute ':vsplit'.bang.' ' . FILENAME
        elseif (splitType ==# 't')
            silent! execute ':tab split'.bang.' ' . FILENAME
        else
            silent! execute ':e'.bang.' ' . FILENAME
        endif
        if (v:errmsg !=# '')
            echo v:errmsg
        endif
    else

        " Find the correct tab corresponding to the existing buffer
        let tabNr = -1
        " iterate tab pages
        for i in range(tabpagenr('$'))
            " get the list of buffers in the tab
            let tabList =  tabpagebuflist(i + 1)
            let idx = 0
            " iterate each buffer in the list
            while idx < len(tabList)
                " if it matches the buffer we are looking for...
                if (tabList[idx] == bufNr)
                    " ... save the number
                    let tabNr = i + 1
                    break
                endif
                let idx = idx + 1
            endwhile
            if (tabNr != -1)
                break
            endif
        endfor
        " switch the the tab containing the buffer
        if (tabNr != -1)
            execute 'tabn '.tabNr
        endif

        " Buffer was already open......check to see if it is in a window
        let bufWindow = bufwinnr(bufNr)
        if (bufWindow == -1)
            " Buffer was not in a window so open one
            let v:errmsg=''
            if (splitType ==# 'h')
                silent! execute ':sbuffer'.bang.' ' . FILENAME
            elseif (splitType ==# 'v')
                silent! execute ':vert sbuffer ' . FILENAME
            elseif (splitType ==# 't')
                silent! execute ':tab sbuffer ' . FILENAME
            else
                silent! execute ':buffer'.bang.' ' . FILENAME
            endif
            if (v:errmsg !=# '')
                echo v:errmsg
            endif
        else
            " Buffer is already in a window so switch to the window
            execute bufWindow.'wincmd w'
            if (bufWindow != winnr())
                " something wierd happened...open the buffer
                let v:errmsg=''
                if (splitType ==# 'h')
                    silent! execute ':split'.bang.' ' . FILENAME
                elseif (splitType ==# 'v')
                    silent! execute ':vsplit'.bang.' ' . FILENAME
                elseif (splitType ==# 't')
                    silent! execute ':tab split'.bang.' ' . FILENAME
                else
                    silent! execute ':e'.bang.' ' . FILENAME
                endif
                if (v:errmsg !=# '')
                    echo v:errmsg
                endif
            endif
        endif
    endif
endfunction

function! ft#ada#GnatGotoDeclaration()
    let l:abs_filepath = fnamemodify(expand('%'), ':p')
    let l:gpr = s:FindGprIn(fnamemodify(l:abs_filepath, ':h'))
    if l:gpr ==# ''
        echohl WarningMsg| echo 'Failed to find a gpr file'
    endif
    let l:word = expand('<cword>')
    try
        let l:result = s:GnatInspect(l:gpr, 'decl', l:word, expand('%'), line('.'))
    catch /.\+ not found/
        echohl WarningMsg| echo v:exception
        return
    endtry
    let parts = split(result[0], ':')
    let l:file = l:parts[1]
    let l:line = l:parts[2]
    let l:column = l:parts[3]
    if l:file !=# l:abs_filepath
        call s:FindOrCreateBuffer(l:file, '', 1)
    endif
    call cursor(l:line, l:column)
    if expand('<cword>') !=? l:word
        let l:line = l:line + s:AdjustLineNumber(l:file)
        call cursor(l:line, l:column)
    endif
endfunction

function! ft#ada#GnatGotoTag()
    let l:abs_filepath = fnamemodify(expand('%'), ':p')
    let l:gpr = s:FindGprIn(fnamemodify(l:abs_filepath, ':h'))
    if l:gpr ==# ''
        echohl WarningMsg| echo 'Failed to find a gpr file'
    endif
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
    let l:column = l:parts[3]
    if l:file !=# l:abs_filepath
        call s:FindOrCreateBuffer(l:file, '', 1)
    endif
    call cursor(l:line, l:column)
    if expand('<cword>') !=? l:word
        let l:line = l:line + s:AdjustLineNumber(l:file)
        call cursor(l:line, l:column)
    endif
endfunction

