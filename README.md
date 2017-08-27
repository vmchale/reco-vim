# reco-vim

[![Build Status](https://travis-ci.org/vmchale/reco-vim.svg?branch=master)](https://travis-ci.org/vmchale/reco-vim)

This is meant to provide a layer on top of
[vim-go](https://github.com/fatih/vim-go) for use with the Reconfigure.io
[reco](http://docs.reconfigure.io/getting_started.html) compiler.

Currently, it just adds `reco` as a syntax checker usable with
[syntastic](https://github.com/vim-syntastic/syntastic).

## Installation

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'vim-syntastic/syntastic'
Plug 'vmchale/reco-vim
```

I use this plugin alongside [vim-go](https://github.com/fatih/vim-go).

## Configuration

To check a file using `reco`:

```vim
:RecoCheck
```

I have the following in my `.vimrc` to map this to an easy keybinding:

```vim
au BufRead,BufNewFile *.go nnoremap rc <Plug>RecoCheck
```

You can tell Syntastic to check `.go` files automatically with:

```vim
let g:syntastic_go_checkers = [ 'reco' ]
```

Note however that this will give you potentially unwanted errors in other
projects.
