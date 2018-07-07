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
    Plug 'bennyyip/vim-yapf'
    Plug 'chrisbra/NrrwRgn'
    Plug 'dahu/vim-lotr'
    Plug 'davidhalter/jedi-vim'
    Plug 'fisadev/vim-isort'
    Plug 'godlygeek/tabular'
    Plug 'icymind/NeoSolarized'
    Plug 'junegunn/fzf.vim'
    Plug 'lifepillar/pgsql.vim'
    Plug 'mhinz/vim-grepper'
    Plug 'niklasl/vim-rdf'
    Plug 'pearofducks/ansible-vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-surround'
    Plug 'vim-perl/vim-perl6'
    Plug 'w0rp/ale'
    Plug 'xolox/vim-lua-ftplugin'
    Plug 'xolox/vim-misc'
    Plug 'zah/nim.vim', { 'branch': 'master' }
call plug#end()
source $VIMDIR/settings.vim
source $VIMDIR/functions.vim
source $VIMDIR/misc.vim
source $VIMDIR/autocmd.vim
source $VIMDIR/abbreviation.vim
source $VIMDIR/bindings.vim

