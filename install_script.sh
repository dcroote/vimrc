#!/bin/bash

# Renames .vimrc as .vimrc_old if it exists
if [ -f ~/.vimrc ]
then mv ~/.vimrc ~/.vimrc_old && echo "Moved ~/.vimrc to ~/.vimrc_old"
fi

# similarly, renames existing syntax folder
if [ -d ~/.vim/syntax ]
then mv ~/.vim/syntax ~/.vim/syntax_old && echo "Moved ~/.vim/syntax to ~/.vim/syntax_old"
fi

# similarly, renames existing syntax folder
if [ -d ~/.vim/colors ]
then mv ~/.vim/colors ~/.vim/colors_old && echo "Moved ~/.vim/colors to ~/.vim/colors_old"
fi

# create symlink to included vimrc file, add directories
ln -s $PWD/vimrc ~/.vimrc
rsync -a $PWD/syntax/ ~/.vim/syntax/
rsync -a $PWD/colors/ ~/.vim/colors/

# install vim plug and packages in vimrc
mkdir -p ~/.vim/plugged
mkdir -p ~/.vim/autoload

if [ ! -f ~/.vim/autoload/plug.vim ]
then
    curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
    vim +PlugClean +qall
fi
