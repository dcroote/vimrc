#!/bin/bash

# Renames .vimrc as .vimrc_old if it exists
if [ -f ~/.vimrc ]
then mv ~/.vimrc ~/.vimrc_old
fi

# create symlink to included vimrc file
ln -s $PWD/vimrc ~/.vimrc
