let b:php_project_dir = luaeval("require('lspconfig/util').root_pattern('composer.json')(vim.loop.cwd())")
if empty(b:php_project_dir)
    let b:php_project_dir = '.'
endif
let s:vendor_phan_client = b:php_project_dir . '/vendor/bin/phan_client'

if !empty(glob(s:vendor_phan_client))
    let b:php_phan_executable= s:vendor_phan_client
    let s:socket = '.phan/socket'
    let b:php_phan_options = '-s ' . s:socket
    if empty(glob(s:socket))
        call jobstart(['bash', '-c', './vendor/bin/phan -s ' . s:socket . '; rm -f ' . s:socket], {'detach': 1})
    endif
endif

ab pubf public function
ab pubsf public static function
set textwidth=120
