#!/bin/bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install git
brew install --cask iterm2
brew install --cask alfred
brew install docker
brew install --cask typora
brew install --cask dbeaver-community
brew install --cask postman
brew install --cask spacelauncher
brew install --cask shiftit
brew install --cask clipy

brew install --cask youdaodict
brew install --cask qq
brew install --cask wechat
brew install --cask neteasemusic
if [[ ! -d "~/Documents/tools/" ]]; then
    kdir ~/Documents/tools
fi

# install seven-tools
bash <(curl -s https://raw.githubusercontent.com/Blankll/seven-tools/master/setup.sh)

# install powerlevel10k
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
