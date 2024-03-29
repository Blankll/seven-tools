#!/bin/bash -x
# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH="/opt/homebrew/bin:/usr/local/homebrew/bin:$PATH"
# ohmyzsh
if [[ -z $ZSH ]]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ ! -e ~/.profile ]]; then
  touch ~/.profile
fi

if [[ $(uname -m) == "arm64" && $(grep -e "[homebrew | brew]" ~/.zshrc | wc -l | bc) == 0 ]];then
  echo "PATH=/opt/homebrew/bin:$PATH" >> ~/.zshrc
  echo "PATH=/opt/homebrew/bin:$PATH" >> ~/.profile
elif [[ $(uname -m) == "x86_64" && $(grep -e "[homebrew | brew]" ~/.zshrc | wc -l | bc) == 0 ]];then
  echo "PATH=/usr/local/homebrew/bin:$PATH" >> ~/.zshrc
  echo "PATH=/usr/local/homebrew/bin:$PATH" >> ~/.profile
fi

source ~/.profile
source ~/.zshrc

brew install --cask iterm2
brew install --cask docker

brew install git
brew install tig
brew install git-delta
brew install vim && brew link vim --force

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# install seven-tools
bash <(curl -s https://raw.githubusercontent.com/Blankll/seven-tools/master/setup.sh)
# install powerlevel10k
brew install romkatv/powerlevel10k/powerlevel10k
powerlevel_configed=$(cat ~/.zshrc | grep 'powerlevel10k.zsh-theme')
if [[ -z $powerlevel_configed ]]; then
    echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
fi

brew install jq
brew install harelba/q/q # https://github.com/harelba/q

brew install --cask alfred
brew install --cask typora
brew install --cask dbeaver-community
brew install --cask postman
brew install --cask spacelauncher
brew install --cask shiftit
brew install --cask clipy
brew install --cask appcleaner
brew install --cask stats

brew install --cask neteasemusic
brew install --cask youdaodict
brew install --cask qq
brew install --cask wechat
brew install --cask keka
