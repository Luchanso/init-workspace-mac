#!/usr/bin/env bash
set -e

read -p "Enter your name: " username
read -p "Enter your email: " email

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew install git

git config --global user.email "$email"
git config --global user.name "$username"

brew install node
brew install yarn
brew install m-cli

brew cask install google-chrome
brew cask install visual-studio-code
brew cask install slack
brew cask install telegram
brew cask install figma

npm install -g node-gyp n eslint create-react-app http-server eslint-plugin-react eslint-plugin-jsx-a11y eslint-plugin-import eslint-config-airbnb
node --version
npm --version
yarn --version
npm i -g n

echo "Generate ssh key..."
ssh-keygen -t rsa -b 4096 -C "$email"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "----------------------------------------";
cat ~/.ssh/id_rsa.pub
echo "----------------------------------------";

echo DONE.