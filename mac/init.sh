#!/usr/bin/env bash

read -p "Enter your name: " username
read -p "Enter your email: " email

open https://www.google.com/chrome/browser/desktop/index.html
open https://code.visualstudio.com/

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew install git

git config --global user.email "$email"
git config --global user.name "$username"

brew install node
brew install yarn
npm install -g node-gyp n eslint create-react-app http-server eslint-plugin-react eslint-plugin-jsx-a11y eslint-plugin-import eslint-config-airbnb
node --version
npm --version
yarn --version

echo "Generate ssh key..."
ssh-keygen -t rsa -b 4096 -C "$email"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo DONE.