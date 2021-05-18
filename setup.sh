#!/bin/bash

git clone https://github.com/Blankll/seven-vim.git

cd seven-vim

ln -s .$(pwd)/.vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c ":PlugInstall | quit | quit"

vim
