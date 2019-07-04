# NeoVim Configuration

## About

My NeoVim configuration uses [vim-plug](https://github.com/junegunn/vim-plug) to
manage Vim plugins. This configuration was originally based on [strcat
](http://github.com/strcat/dotfiles)'s Vim configuration.

## Installation

```shell
git clone --depth=1 https://github.com/kalkin/vim-config.git

make install
```

## Dependencies

The makefile will install the dependencies via pip3

- *git*
- *Python3*
- *yapf* for prettify Python code
- *jedi* autocompletion and static analysis library for Python
- *isort* utility to sort Python imports
- *vint* Vim script language linter
- *proselint* linter for English prose
- *yamllint* linter for YAML

## Configuration Structure

`$XDG_CONFIG_HOME/vim/init.vim` bootstraps the rest of the config. All plugins
are installed into bundle/ directory, from where they are loaded by pathogen.

### Files Structure

Lines starting with a double quotation mark (") are comments. Furthermore, a
double quotation mark within the line starts a comment unless it is preceded
by a backslash (\") and ended by another. NeoVim allows to give special characters
by writing them in a special notation. The notation encloses descriptive words
in angle brackets (<>). Read all about it with ":help <>".

The characters you will most often are

- `<C-M>` for control-m
- `<C-V>` for control-v which quotes the following character
- `<ESC>` for the escape character.
- `<Fn>` for F1, F2, ..
- `<C-n>` for CTRL-N (i. e. CTRL-a, CTRL-k, ..)

### Directory Structure

By default `$XDG_CONFIG_HOME` is set to `~/.config`.

```
~/.config/nvim/
  ├──╼ autoload/     # Contains symlink to pathogen
  ├──╼ bundle/       # Contains all installed plugins
  ├──╼ colors/       # Color scheme files
  ├──╼ ftdetect/     # Own filetype detection scripts
  ├──╼ snippets/     # Contains snipmate-snippets
  ├──╼ templates/    # Own template files
  └──╼ vim-plug/     # Contains vim-plug autoload script
```

## Learn NeoVim

- run `vimtutor` from your Unix/Linux-prompt and go through it
- If you need help understanding some setting in my config files press K over a
  word and help will open and explain it

### Vim Internal Documentation

Try the documentation :help your\_keyword:

| WHAT                  |  PREPEND  | EXAMPLE           |
|-----------------------|-----------|-------------------|
| Normal mode commands  | (nothing) | :help x           |
| Visual mode commands  |     v\_   | :help v\_u        |
| Insert mode commands  |     i\_   | :help i\_<Esc>    |
| command-line commands |     :     | :help :quit       |
| command-line editing  |     c\_   | :help c\_<Del>    |
| Vim command arguments |     \-    | :help -r          |
| options               |     '     | :help 'textwidth' |

### Websites

- [NeoVim-Homepage](http://www.neovim.io/)
- [Vim tips Wiki](http://vim.wikia.com/)
- [Sven's Vim Page](http://www.guckes.net/vim/)
- [VI Lover's Homepage](http://www.thomer.com/vi/vi.html)
- [Best of Vim Tips](http://www.rayninfo.co.uk/vimtips.html)
- [Vim Subreddit](http://www.reddit.com/r/vim)
- German newsgroup for editors news:de.comp.editoren
- International newsgroup for editors news:comp.editors
