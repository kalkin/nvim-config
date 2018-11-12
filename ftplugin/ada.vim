function! Beautify()
    let l = line('.')
    let c = col('.')
    write
    exec system('gnat pretty -c3 -c4 -W8 -rnb ' . bufname('%') . ' -cargs -gnatW8')
    call cursor(l, c)
endfunction

nmap <buffer> <silent> <leader><Return> :call Beautify()<CR>:e<CR>
