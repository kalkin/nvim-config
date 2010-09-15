" Information 
" {{{
" vim:foldmarker={{{,}}} tw=80
" Last Modified [ 2009-05-16 ]
" File:     ~/.vimrc
" Author:   kalkin-
" Purpose:  setup file for the editor "vim"
" Notices:  This file is heavily based on Christian 'strcat' Schneiders
"           vimrc http://strcat.de/dotfiles/vim/vimrc
" Version:  This setup file is designated for vim 7.1
"
" Structure of this file:
"       First up is the settings that I use. They are ordered alphabetically
"       to make it easier to access a specific item. Basically a simple way
"       to sort data :-) These are not all the possible settings, but the ones
"       that I have found relevant to control. (:h options)
"
"       There are three kinds of things which are defined in this file:
"       Mappings ("map"), settings ("set"), and abbreviations ("ab").
"               - Settings affect the behaviour of commands.
"               - Mappings maps a key sequence to a command.
"               - Abbreviations define words which are replaced right 
"                 *after* they are typed in.
"       Here is an overview of map commands and in which mode they work:
"         ,----
"         | :map               Normal, Visual and Operator-pending
"         | :vmap              Visual
"         | :nmap              Normal
"         | :omap              Operator-pending
"         | :map!              Insert and Command-line
"         | :imap              Insert
"         | :cmap              Command-line
"         `----
"       Lines starting with an inverted comma (") are comments. Furthermore,
"       's within the line starts a comment unless it is preceeded by a
"       backslash (\").  VIM allows to give special characters by writing them
"       in a special notation.  The notation encloses descriptive words in angle
"       brackets (<>).
"       Read all about it with ":help <>".
"          The characters you will most often are:
"               - <C-M> for control-m
"               - <C-V> for control-v which quotes the following character
"               - <ESC> for the escape character.
"               - <Fn>  for F1, F2, ..
"               - <C-n> for control-n (i. e. strg-a, strg-k, ..)
" setting description:
" [global] ... global setting
" [buffer] ... local to a buffer
" [window] ... settings for a window
" [glo-lo] ... global or local (buffer) setting. :setlocal for local value
" 
" Some mappings and options are commented out. Remove the comment to enable them.
" 
" All control characters have been replaced to use the angle notation
" so you should be able to read this filw without problems.
"
" ~/.vim/
"     +---> colors/     # color scheme files
"     +---> doc/        # documentations
"     +---> forms/      # submittals
"     +---> ftplugin/   # filetype plugins
"     +---> macros/     # macros common to both versions of VIM
"     +---> plugin/     # plugins common to both versions of VIM
"     +---> syntax/     # syntax files
"     +---> templates/  # Own template files
"
" To learn VIM:
"   -> run \"vimtutor" from your Unix/Linux-prompt and go through it
"   -> RTFM - read the f****** - ah - FINE manual ;-)
"   -> visit the websites mentioned in this document
"       * <http://www.vim.org/>                    - vim-homepage
"       * <http://www.guckes.net/vim/>             - Sven's Vim Page
"       * <http://hermitte.free.fr/vim/>           - Luc's Hermitte
"       * <http://www.liacs.nl/~jvhemert/vim/>     - Jano's Vim Macro Page
"       * <http://users.erols.com/astronaut/vim/>  - Dr Chip's Vim Page
"       * <http://www.thomer.com/vi/vi.html>       - VI Lover's Homepage
"       * <http://www.rayninfo.co.uk/vimtips.html> - Best of Vim Tips
"       * <news:de.comp.editoren>                  - german newsgroup with topic
"                                                    editors
"       * <news:comp.editors>                      - international newsgroup
"                                                    with topic editors
"   -> Try the documentation :help your_keyword
"               WHAT                   PREPEND    EXAMPLE
"               Normal mode commands  (nothing)   :help x
"               Visual mode commands      v_      :help v_u
"               Insert mode commands      i_      :help i_<Esc>
"               command-line commands     :       :help :quit
"               command-line editing      c_      :help c_<Del>
"               Vim command arguments     -       :help -r
"               options                   '       :help 'textwidth'
"
"  To use this setup file, copy it to
"            Linux/Unix:  ~/.vimrc
"                  OS/2:  ~/.vimrc or $VIM/.vimrc (or _vimrc)
"             for Amiga:  s:.vimrc or $VIM/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc or $VIM/_vimrc
"           for OpenVMS:  sys$login:.vimrc
"
"  ,----[ $ vim --version ]
"  | VIM - Vi IMproved 7.1 (2007 May 12, compiled Oct 18 2007 19:48:15)
"  | Compiled by kalkin-
"  | Huge version without GUI.  Features included (+) or not (-):
"  | -arabic +autocmd -balloon_eval -browse ++builtin_terms +byte_offset +cindent
"  | -clientserver -clipboard +cmdline_compl +cmdline_hist +cmdline_info
"  | +comments -cryptv +cscope -cursorshape +dialog_con +diff -digraphs -dnd
"  | -ebcdic -emacs_tags +eval +ex_extra +extra_search -farsi +file_in_path
"  | +find_in_path +folding -footer +fork() -gettext -hangul_input +iconv
"  | +insert_expand +jumplist +keymap +langmap -libcall +linebreak -lispindent
"  | +listcmds +localmap +menu +mksession +modify_fname -mouse -mouse_dec
"  | -mouse_gpm -mouse_jsbterm -mouse_netterm -mouse_xterm +multi_byte
"  | +multi_lang -mzscheme -netbeans_intg -osfiletype +path_extra -perl
"  | +postscript +printer +profile -python +quickfix +reltime -rightleft -ruby
"  | +scrollbind +signs +smartindent -sniff +statusline -sun_workshop +syntax
"  | +tag_binary -tag_old_static -tag_any_white -tcl +terminfo -termresponse
"  | +textobjects +title -toolbar +user_commands +vertsplit +virtualedit +visual
"  | +visualextra +viminfo +vreplace +wildignore +wildmenu +windows +writebackup
"   -X11 -xfontset -xim -xsmp -xterm_clipboard -xterm_save 
"  |    system vimrc file: "$VIM/vimrc"
"  |      user vimrc file: "$HOME/.vimrc"
"  |       user exrc file: "$HOME/.exrc"
"  |   fall-back for $VIM: "/usr/local/share/vim"
"  | Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H     -g -O        
"  | Linking: gcc   -L/usr/local/lib -o vim       -lncurses  -liconv  
"  `----                           
"
"  Compiled with:
"   ./configure --enable-multibyte --disable-darwin --with-mac-arch=current
"   --without-x --disable-gui --with-compiledby='kalkin-' --with-features=huge 
"    CFLAG="-Wno-long-double -fast -mcpu=7450 -fPIC"
"
"  ,----[ Stuff i need, and you probably don't! ]
"  | This flag CFLAG="-Wno-long-double -fast -mcpu=7450 -fPIC" optimise the
"  | binary to run as fast as it's pssible on a G4. I compiled vim with
"  | powerpc-apple-darwin8-gcc-4.0.1. It should also work with any other gcc
"  | on a G4 cpu.
"  |
"  | REMOVE THE CFLAG IF YOU DON'T HAVE A G4 MICROPROCESSOR!
"  |
"  | The options --disable-darwin --with-mac-arch=current is needed for 
"  | MacOsX only.
"  |
"  | I've made some changes in the file src/features.h, which (i think) are
"  | usefull, you will probably find them annoying. I'm using 
"  | --with-features=huge but before compiling vim i removed feautures
"  | which i don't need. For more information look here: 
"  | http://files.blase16.de/files/diff/vim71/feature.h.diff
"  `----
"
" Powered By:   MacOSX tendotfourdotten, zsh, Volvic, Nescafe Esspresso with
"               Schlagsahne, (I run out of milk :( ), some old fashioned russian
"               rock, MandoDiao Rammstein, Kettcar and other music remixed by my
"               iTunes great Party-Jukebox.
"
"  ,----[ Special thanks goes to: ]
"  | The Fink project (http://fink.sf.net/) for they overbloated and slow 
"  | vim package with many unneeded features like +rightleft (for what do i
"  | need this?). If not you guys i've never written this and was never
"  | forced to compile and optimise vim.
"  |
"  | Do you see the difference?
"  | $ time /sw/bin/vim -c ":q"
"  | /sw/bin/vim -c ":q"  0,04s user 0,06s system 1% cpu 7,002 total
"  | $ time /usr/local/bin/vim
"  | ./vim -c ":q"  0,01s user 0,02s system 9% cpu 0,369 total
"  `----
"
" }}}

" Options initiating with [A]
" {{{
" [glo-lo] |'autoread'| autom. reread file when changed outside of Vim
set ar              "autom. read changes

" }}}

" Options initiating with [B]
" {{{
" [global] |'background'| "dark" or "light", used for highlight colors
set bg=dark 

" [global] |'backspace'| how backspace works at start of line
set bs=2
" }}}

" Options initiating with [C]
" {{{
" [buffer] |'cindent'|  do C program indenting
set cin 

" [global] |'cmdheight'| Disable the 'Press RETURN...' - Messages
set ch=2

" [global] |'colorcolumn'| is a comma separated list of screen columns that are
" highlighted with ColorColumn hl-ColorColumn.
set cc=+1

" [global] |'cmdwinheight'| Fives lines should be enough
set cwh=5

" [global] |'cp'| Vim either more Vi-compatible or make Vim really usefull
set nocompatible        "this is vim not vi!

set completeopt=longest,menu

set complete+=k


" }}}

" Options initiating with [D]
" {{{
" [global] |'display'| to display as much as possible of the last line in a
"                      window instead of displaying the '@' symbols.
set dy=lastline
" }}}

" Options initiating with [E]
" {{{
" [global] |'encoding'| encoding used internally
set encoding=utf-8

" [buffer] |'expandtab'| Tabs are expanded to spaces
set expandtab
" }}}

"" Options initiating with [F]
"" {{{

"" [local] |'fileencoding'| multicultural, even in fonts
set fenc=utf-8

"" [global] |'fileformat'| The Right Way(tm)
set ff=unix

"" [window] |'fdm'| Is folding really evile?
set foldmethod=marker

"" [window] |'fmr'| markers used when 'foldmethod' is marker
set foldmarker={,}

"" [global] |'foldclose'| when set to all a fold is closed when the cursor isn't
""  in it
set fcl=

set foldlevel=1

"" [window] |'foldcolumn'| If n>0 a colum with width n is shown which indicates
" foldings
set fdc=1

"" [global] |'foldopen'| Specifies for which type of commands folds will be openx
" ,--------[ Options ]
" | item    command
" | all     any
" | block   "(", "{", "[[", "[{", etc.
" | hor     horizontal movements: "l", "w", "fx", etc
" | insert  any command in Insert mode
" | jump    far jumps: "G", "gg" etc..
" | mark    jumping to mark
" | percent "%"
" | quickfix ":cn", ":crew", ":make" etc
" | search   search for a pattern "/", "n", "*", "gd"
" | tag     jumping to a tag
" | undo    undo or redo
" `--------

set fdo=insert,jump,tag,mark,quickfix,search

"" }}}

" Options initiating with [H]
" {{{
" [global] |'hlsearch'| Simple press <F4> to stop it.
set hls 

" [global] |'history'| Amount of ':' commands and search pattern which should be
"                      storedb by vim for each of histories
set hi=1000

" }}}

" Options initiating with [I]
" {{{
" [incsearch] |'incsearch'| While typing a search command, show where the
" pattern, as it was typed so far, matches.
set is

" [global] |'ignorecase'| Ignore the case in search patterns
set ic

" [buffer] |'infercase'| look in :help infercase. complicated to explain
" set inf

" }}}

" Options initiating with [L]
" {{{
" [global] |'laststatus'| show statusline
set ls=2
" }}}

" Options initiating with [M]
" {{{
" [buffer] |'matchparis'| Characters that form pairs
set mps+=<:>

" [global] |'mouse'| Use mouse in vim on console, xterm, ect..
" ,------[ Mouse Options ]-----
" | y    - Normal Mode
" | v    - Visual Mode 
" | i    - Insert Mode 
" | c    - Command-line Mode 
" | h    - all previous modes, when editing a help file
" | a    - all previous modes
" | r    - for hit-enter and more-mode
" `-----
"set mouse=a 
" }}}

" Options initiating with [N]
" {{{

" [window] |'number'| Show line numbers
set nu

" [window] |'numberwidth'| Minimal number of columns to use for the line number.
set nuw=3
" }}}

" Options initiating with [P]
" {{{
"set pastetoggle=<F11>

" }}}

" halted on ruler

set shiftwidth=4           "shift by 4 characters
set smarttab               "tab smartly ;)
set tabstop=4              "tabstop every 4 characters
set wildmenu               "fancy tab completion

syntax on

" ---[ AUF SMARTINDENT UMSTEIGEN?]
" ---[ FENC usen. damit kann ich einfach ein iso file aufmachen, speichern und
"  das ist utf8]

set printoptions=paper:A4,number:y,header:1,left:5mm,top:5mm,bottom:5mm,right:5mm,duplex:off  "printing options
set listchars=tab:>.,trail:_,extends:>,precedes:<       "special characters




" [global] |'showcmd'| Show (partial) command in status line
set sc

" [global] |'showmatch'|  when a bracket is inserted, briefly jump to the matching one 
set sm

" [global] |'showmode'| display current mode
set smd

" [global] |'smartcase'| Override the 'ignorecase' option if the search pattern contains
"                        upper case characters.
set scs

" [buffer] |'softtabstop'| Number of spaces that a <Tab> counts for while performing editing
"                          operations
set sts=4


set stl=%<[%n]\ %F\ \ Filetype=\%Y\ \ %r\ %1*%m%*%w%=%(Line:\ %l%)%4(%)Column:\ %5(%c%V/%{strlen(getline(line('.')))}%)\ %4(%)%p%%

" [global] |'ttyfast'| are we using a fast terminal? Yeppa!!!!11
set tf

" [buffer] |'tabstop'| number of spaces that a <Tab> in the file counts for
set ts=4

set termencoding=utf-8


" [global] |'undolevels'| undoing 1000 changes should be enough
set ul=1000

" [global] |'updatecount'| write swap file to disk after each 150 characters
set uc=150

" [global] |'wildignore'|  A list of file patterns which are ignored on
" completing files or directories
set wig=*.o,*.obj,*swp,*.bac,*.class

" [global] |'wildmenu'| When 'wildmenu' is on, command-line completion operates in an
"                       enhanced mode. 
set wmnu

" Let's be friendly :)
autocmd VimEnter * echo "Welcome back kalkin :)"
autocmd VimLeave * echo "Cya in Hell."


" Set dictionary to syntax file
autocmd FileType * exec('set  dict+='.$VIMRUNTIME.'/syntax/'.getbufvar("%","current_syntax").'.vim')

set pumheight=7
set sps=best,10


" Highlight current line in insert mode.
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

filetype plugin on


" Abbrevations
iab TDY <C-R>=strftime("%Y-%m-%d")<CR>
ab NRM :Author:    Kalkin Sam<CR>:Email:     mail@kalkin.de<CR>:Date:      <C-R>=strftime("%Y-%m-%d")<CR>

autocmd BufNewFile,BufRead *.p6 setf perl6

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " ...
endif


" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

if &t_Co >= 256
    colorscheme mustang
endif
let mapleader=","
source ~/.vim/vimbindings
