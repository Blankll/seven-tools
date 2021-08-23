# seven-vim

## use my vim settings
one line command:
```bash
bash <(curl -s https://raw.githubusercontent.com/Blankll/seven-vim/master/setup.sh)
```
or load manually:

1. download repostory
```bash
git clone https://github.com/Blankll/seven-vim.git
```
or download manually and extract the compressed file

2. create soft link for  .vimrc to ~/ directory
```bash
cd ~/
ln -s $(pwd-to-seven-vim)/.vimrc ~/.vimrc
```

3. install vim-plug
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
4. install plugs which listed in .vimrc
open vim, run command bellow:
```bash
:source ~/.vimrc
```
5. reopen your terminal to start enjoy the vim

