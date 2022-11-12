#!/bin/bash -x

latest_version=($(curl -Ls https://github.com/Blankll/seven-tools/releases | grep -A 3 '<span class="ml-1 wb-break-all">.*' | grep -o -E 'v[0-9].*'))

if [[ -f "${latest_version}.zip" ]]; then
    rm "${latest_version}.zip"
fi
if [[ -d "tool-${latest_version}" ]]; then
    rm -rf "tool-${latest_version}"
fi

curl -L "https://github.com/Blankll/seven-tools/archive/refs/tags/${latest_version}.zip" -o "${latest_version}.zip"
unzip "${latest_version}.zip" -d "tool-${latest_version}"

tool_dir=$(ls "tool-${latest_version}")
tool_dir="tool-${latest_version}/${tool_dir}"

if [[ ! -d "~/Documents/tools" ]]; then
    mkdir -p ~/Documents/tools
fi

mv $tool_dir ~/Documents/tools
rm "${latest_version}.zip"
cd ~/Documents/tools

ln -s $(pwd)/.vimrc ~/.vimrc

# config git-delta
delta_configed=$(cat ~/.gitconfig | grep 'delta')
if [[ -z $delta_configed ]]; then
    cat ./delta-gitconfig.txt >> ~/.gitconfig
fi
# config tig
ln -s $(pwd)/.tigrc ~/.tigrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -E -s -u "$HOME/.vimrc" +PlugInstall +qall

# clean up
if [[ -f "${latest_version}.zip" ]]; then
    rm "${latest_version}.zip"
fi
if [[ -d "tool-${latest_version}" ]]; then
    rm -rf "tool-${latest_version}"
fi
