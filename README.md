# dotfiles

Configuration files including .vimrc, .bahsrc, etc.

## Installation

    $ cd
    $ git clone git@github.com:gwilbur/dotfiles.git .dotfiles/
    $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    $ cd .dotfiles/
    $ ls | grep -v README.md | xargs -I% ln -s `pwd`/% ~/.%
