let b:ale_php_phan_use_client=1
let b:php_project_dir = luaeval("require('lspconfig/util').root_pattern('composer.json')(vim.loop.cwd())")
if empty(b:php_project_dir)
    let b:php_project_dir = '.'
endif
let s:vendor_phan_client = b:php_project_dir . '/vendor/bin/phan_client'

if !empty(glob(s:vendor_phan_client))
    let b:ale_php_phan_executable= s:vendor_phan_client
    let s:socket = '.phan/socket'
    let b:ale_php_phan_options = '-s ' . s:socket
    if empty(glob(s:socket))
        call jobstart(['bash', '-c', './vendor/bin/phan -s ' . s:socket . '; rm -f ' . s:socket], {'detach': 1})
    endif
endif

let b:ale_linters = ['phan-custom', 'phpcs', 'phpmd']
let b:ale_fixers = { 'php': ['phpcbf'] }

call ale#Set('php_phan_options', '')

function GetCommand(buffer) abort
    if ale#Var(a:buffer, 'php_phan_use_client') == 1
        let l:args = ale#Pad(ale#Var(a:buffer, 'php_phan_options')) . ' '
        \   . '-l '
        \   . ' %s'
    else
        let l:args = ale#Pad(ale#Var(a:buffer, 'php_phan_options')) . ' '
        \   . '-y '
        \   . ale#Var(a:buffer, 'php_phan_minimum_severity')
        \   . ' %s'
    endif

    let l:executable = ale_linters#php#phan#GetExecutable(a:buffer)

    return ale#Escape(l:executable) . ' ' . l:args
endfunction

call ale#linter#Define('php', {
\   'name': 'phan-custom',
\   'executable': function('ale_linters#php#phan#GetExecutable'),
\   'command': function('GetCommand'),
\   'callback': 'ale_linters#php#phan#Handle',
\})

ab pubf public function
ab pubsf public static function
set textwidth=120

setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldmethod=expr
