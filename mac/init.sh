#!/usr/bin/env bash

open https://www.google.com/chrome/browser/desktop/index.html
open https://code.visualstudio.com/

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew install git

echo "git config --global user.email "email@example.com""
echo "git config --global user.name "Luchansky Oleg""

git config --global user.email "email@example.com"
git config --global user.name "Luchansky Oleg"

brew install node
brew install yarn
npm install -g node-gyp n eslint create-react-app http-server eslint-plugin-react, eslint-plugin-jsx-a11y, eslint-plugin-import, eslint-config-airbnb
node --version
npm --version
yarn --version

echo "Generate ssh key..."
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

echo DONE.