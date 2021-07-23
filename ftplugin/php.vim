let b:ale_php_phan_use_client=1
let b:ale_fixers = { 'php': ['phpcbf'] }
"let g:ale_php_langserver_use_global = 1
let g:ale_completion_enabled

nnoremap <buffer> <C-]> :call LanguageClient_textDocument_definition()<CR>

