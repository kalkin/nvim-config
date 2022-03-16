" Information 
" {{{
" vim:foldmarker={{{,}}} tw=80 ft=vim
" Last Modified [ 2010-09-16 ]
"
" This file just sources my configuration files. 
"
" }}}
if empty($XDG_DATA_HOME)
  let $XDG_DATA_HOME = $HOME.'/.local/share'
endif

if empty($XDG_CONFIG_HOME)
  let $XDG_CONFIG_HOME = $HOME.'/.config'
endif

let $NVIM_HOME = $XDG_CONFIG_HOME . '/nvim'

set viminfo+=n$XDG_DATA_HOME/nvim/viminfo

function! InstallTsLanguages(info)
    if a:info.status ==# 'installed' || a:info.force
        :TSInstall maintained
        :call system('pip install -U jedi-language-server')
    elseif a:info.status ==# 'updated'
        :TSUpdate
        :call system('pip install -U jedi-language-server')
    else
        :call system('pip uninstall -y jedi-language-server')
    endif
endfunction


call plug#begin()
    Plug 'aklt/plantuml-syntax'
    Plug 'airblade/vim-gitgutter'
    Plug 'chrisbra/NrrwRgn'
    Plug 'dahu/vim-lotr'
    Plug 'godlygeek/tabular'
    Plug 'hashivim/vim-terraform'
    Plug 'icymind/NeoSolarized'
    Plug 'junegunn/fzf.vim'
    Plug 'lervag/vimtex', { 'for': 'tex' }
    Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }
    Plug 'simnalamburt/vim-mundo'
    Plug 'rickhowe/diffchar.vim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'pearofducks/ansible-vim', { 'for': 'yaml.ansible' }
    Plug 'pseewald/vim-anyfold', { 'for': 'ada' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'tarekbecker/vim-yaml-formatter'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-vinegar'
    Plug 'Raku/vim-raku', { 'for': 'raku' }
    Plug 'vito-c/jq.vim', { 'for': 'jq' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': function('InstallTsLanguages')}
    Plug 'tami5/lspsaga.nvim'  " UI around LSP
    Plug 'w0rp/ale', { 'do': 'pip3 install vim-vint proselint yamllint --user --upgrade' }
    Plug 'soli/prolog-vim'
    Plug 'zaid/vim-rec'

    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

    Plug 'knubie/vim-kitty-navigator', {'do': 'cp ./*.py ~/.config/kitty/'}
    Plug 'gko/vim-coloresque'
call plug#end()

source $NVIM_HOME/settings.vim
source $NVIM_HOME/misc.vim
source $NVIM_HOME/autocmd.vim
source $NVIM_HOME/abbreviation.vim
source $NVIM_HOME/bindings.vim
