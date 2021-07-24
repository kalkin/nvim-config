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

set viminfo+=n$NVIM_HOME/viminfo

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
    Plug 'arrufat/vala.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'camilledejoye/phpactor-mappings', { 'for': 'php' }
    Plug 'chrisbra/NrrwRgn'
    Plug 'tmhedberg/SimpylFold'
    Plug 'dahu/vim-lotr'
    Plug 'godlygeek/tabular'
    Plug 'icymind/NeoSolarized'
    Plug 'junegunn/fzf.vim'
    Plug 'lervag/vimtex', { 'for': 'tex' }
    Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }
    Plug 'simnalamburt/vim-mundo'
    Plug 'rickhowe/diffchar.vim'
    Plug 'mhinz/vim-grepper'
    Plug 'niklasl/vim-rdf', { 'for': 'rdf' }
    Plug 'neovim/nvim-lspconfig'
    Plug 'pearofducks/ansible-vim', { 'for': 'yaml.ansible' }
    Plug 'pseewald/vim-anyfold', { 'for': 'ada' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'tarekbecker/vim-yaml-formatter'
    Plug 'tpope/vim-eunuch'
    Plug 'rhysd/git-messenger.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-vinegar'
    Plug 'Raku/vim-raku', { 'for': 'raku' }
    Plug 'vito-c/jq.vim', { 'for': 'jq' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': function('InstallTsLanguages')}
    Plug 'glepnir/lspsaga.nvim' " UI around LSP
    Plug 'w0rp/ale', { 'do': 'pip3 install vim-vint proselint yamllint --user --upgrade' }
    Plug 'soli/prolog-vim'
    Plug 'zaid/vim-rec'
call plug#end()

source $NVIM_HOME/settings.vim
source $NVIM_HOME/misc.vim
source $NVIM_HOME/autocmd.vim
source $NVIM_HOME/abbreviation.vim
source $NVIM_HOME/bindings.vim
