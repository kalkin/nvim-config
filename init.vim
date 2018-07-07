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
    Plug 'Chiel92/vim-autoformat'
    Plug 'airblade/vim-gitgutter'
    Plug 'bennyyip/vim-yapf', { 'for': 'python' }
    Plug 'chrisbra/NrrwRgn'
    Plug 'dahu/vim-lotr'
    Plug 'davidhalter/jedi-vim', { 'for': 'python' }
    Plug 'fisadev/vim-isort', { 'for': 'python' }
    Plug 'godlygeek/tabular'
    Plug 'icymind/NeoSolarized'
    Plug 'junegunn/fzf.vim'
    Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }
    Plug 'mhinz/vim-grepper'
    Plug 'niklasl/vim-rdf', { 'for': 'rdf' }
    Plug 'pearofducks/ansible-vim', { 'for': 'yaml.ansible' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-surround'
    Plug 'vim-perl/vim-perl6', { 'for': 'perl6' }
    Plug 'w0rp/ale'
    Plug 'xolox/vim-lua-ftplugin', { 'for': 'lua' }
    Plug 'xolox/vim-misc', { 'for': 'lua' }
    Plug 'zah/nim.vim', { 'branch': 'master', 'for': 'nim' }
call plug#end()
source $VIMDIR/settings.vim
source $VIMDIR/misc.vim
source $VIMDIR/autocmd.vim
source $VIMDIR/abbreviation.vim
source $VIMDIR/bindings.vim

