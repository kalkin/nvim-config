let b:ale_php_phan_use_client=1
let b:php_project_dir = luaeval("require('lspconfig/util').root_pattern('composer.json')(vim.loop.cwd())")
if empty(b:php_project_dir)
    let b:php_project_dir = '.'
endif

let b:ale_php_phan_executable= b:php_project_dir . '/vendor/bin/phan'
let b:ale_fixers = { 'php': ['phpcbf'] }
let g:ale_completion_enabled

