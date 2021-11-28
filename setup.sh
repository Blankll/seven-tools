#!/bin/bash

versions=($(curl -Ls https://github.com/Blankll/seven-tools/releases | grep -A 3 '<span class="ml-1 wb-break-all">.*' | grep -o -E 'v[0-9].*'))
latest_version=$versions[1]

curl -L "https://github.com/Blankll/seven-tools/archive/refs/tags/${latest_version}.zip" -o "${latest_version}.zip"
unzip "${latest_version}.zip"
if [[ ! -d "~/Documents/tools" ]]; then
    mkdir -p ~/Documents/tools
fi

mv seven-tools-$latest_version ~/Documents/tools
rm "${latest_version}.zip"
cd ~/Documents/tools

ln -s $(pwd)/.vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -E -s -u "$HOME/.vimrc" +PlugInstall +qall

