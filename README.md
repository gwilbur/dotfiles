# dotfiles

Configuration files including .vimrc, .bahsrc, etc.

## Installation

    $ cd
    $ git clone git@github.com:gwilbur/dotfiles.git .dotfiles/
    $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    $ cd .dotfiles/
    $ ls | grep -v README.md | xargs -I% ln -s `pwd`/% ~/.%
