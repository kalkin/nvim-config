" Information 
" {{{
" vim:foldmarker={{{,}}} tw=80 ft=vim
" Last Modified [ 2010-09-16 ]
"
" This file just sources my configuration files. 
"
" }}}

if empty($XDG_CACHE_HOME)
  let $XDG_CACHE_HOME = $HOME.'/.cache'
endif
if empty($XDG_CONFIG_HOME)
  let $XDG_CONFIG_HOME = $HOME.'/.config'
endif


if has('nvim')
    let $VIMDIR = $XDG_CONFIG_HOME.'/nvim'
else
    let $VIMDIR = $XDG_CONFIG_HOME.'/vim'
end


call plug#begin($VIMDIR.'/bundle')
    Plug 'aklt/plantuml-syntax'
    Plug 'arrufat/vala.vim'
    Plug 'Chiel92/vim-autoformat'
    Plug 'airblade/vim-gitgutter'
    Plug 'bennyyip/vim-yapf', { 'for': 'python' , 'do': 'pip3 install yapf --user --upgrade'}
    Plug 'brandonbloom/vim-factor', { 'for': 'factor' }
    Plug 'chrisbra/NrrwRgn'
    Plug 'dahu/vim-lotr'
    Plug 'davidhalter/jedi-vim', { 'for': 'python', 'do': 'pip3 install jedi --user --upgrade' }
    Plug 'fisadev/vim-isort', { 'for': 'python', 'do': 'pip3 install isort --user --upgrade' }
    Plug 'godlygeek/tabular'
    Plug 'icymind/NeoSolarized'
    Plug 'junegunn/fzf.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'lervag/vimtex', { 'for': 'tex' }
    Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }
    Plug 'mbbill/undotree'
    Plug 'mhinz/vim-grepper'
    Plug 'niklasl/vim-rdf', { 'for': 'rdf' }
    Plug 'pearofducks/ansible-vim', { 'for': 'yaml.ansible' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-vinegar'
    Plug 'vim-perl/vim-perl6', { 'for': 'perl6' }
    Plug 'vim-scripts/taglist.vim'
    Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
    Plug 'vito-c/jq.vim', { 'for': 'jq' }
    Plug 'w0rp/ale', { 'do': 'pip3 install vim-vint proselint yamllint --user --upgrade' }
    Plug 'xolox/vim-lua-ftplugin', { 'for': 'lua' }
    Plug 'xolox/vim-misc', { 'for': 'lua' }
    Plug 'zah/nim.vim', { 'branch': 'master', 'for': 'nim' }
    Plug 'jason0x43/vim-js-indent'
    Plug 'soli/prolog-vim'
call plug#end()
source $VIMDIR/fzf.vim
source $VIMDIR/settings.vim
source $VIMDIR/misc.vim
source $VIMDIR/autocmd.vim
source $VIMDIR/abbreviation.vim
source $VIMDIR/bindings.vim
