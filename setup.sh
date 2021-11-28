#!/bin/bash

git clone https://github.com/Blankll/seven-tools.git

cd seven-tools

ln -s $(pwd)/.vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -E -s -u "$HOME/.vimrc" +PlugInstall +qall

