#!/bin/bash

# Renames .vimrc as .vimrc_old if it exists
if [ -f ~/.vimrc ]
then mv ~/.vimrc ~/.vimrc_old && echo "Moving ~/.vimrc to ~/.vimrc_old"
fi

# similarly, renames existing syntax folder
if [ -d ~/.vim/syntax ]
then mv ~/.vim/syntax ~/.vim/syntax_old && echo "Moving ~/.vim/syntax to ~/.vim/syntax_old"
fi

# create symlink to included vimrc file
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/syntax ~/.vim/syntax
