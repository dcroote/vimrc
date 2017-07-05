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
rsync -a $PWD/syntax/ ~/.vim/syntax/

# install vim plug and packages in vimrc
mkdir -p ~/.vim/plugged
mkdir -p ~/.vim/autoload

if [ ! -f ~/.vim/autoload/plug.vim ]
then
    curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
    vim +PlugClean +qall
fi
