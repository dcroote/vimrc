#!/bin/bash

mkdir -p ~/.vim

backup() {
    for f in "$@"
    do
       if [ -e "$f" ]
           then
               renamed="$f".bak.$(date +%Y%m%d%H%M)
               mv "$f" "$renamed"
               echo "Moved existing $f to $renamed"
       fi
     done
}

# backup files / directories, if they exist, before replacement
backup ~/.vimrc ~/.vim/syntax ~/.vim/colors ~/.tmux.conf
rsync -a $PWD/vimrc ~/.vimrc
rsync -a $PWD/syntax/ ~/.vim/syntax/
rsync -a $PWD/colors/ ~/.vim/colors/
rsync -a $PWD/.tmux.conf ~/.tmux.conf

# install vim-plug and plugins, if necessary
mkdir -p ~/.vim/plugged
mkdir -p ~/.vim/autoload
if [ ! -f ~/.vim/autoload/plug.vim ]
then
    curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim
fi

vim +PlugInstall +qall
vim +PlugClean +qall
