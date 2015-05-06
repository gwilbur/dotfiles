# dotfiles

Configuration files including .vimrc, .bahsrc, etc. To install, run from this
directory (backup your own files as necessary):

    ls | grep -v README.md | xargs -I% ln -s `pwd`/% ~/.%

To uninstall:

    ls | grep -v README.md | xargs -I% rm ~/.%
