#!/usr/bin/env bash
set -e

if [[ -z "${CI}" ]]; then
sudo -v

read -p "Enter your name: " username
read -p "Enter your email: " email
else
username="test"
email="test@test.com"
fi

###############################################################################
# Keyboard                                                                    #
###############################################################################
echo "Setting up Keyboard"

defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 1

###############################################################################
# Dock                                                                        #
###############################################################################
echo "Setting up Dock"

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

###############################################################################
# Screen                                                                      #
###############################################################################
echo "Setting up Screen"

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

###############################################################################
# Terminal                                                                    #
###############################################################################
echo "Setting up Terminal"

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

###############################################################################
# Brew                                                                        #
###############################################################################
echo "Setting up Brew and applications"

if [[ -z "${CI}" ]]; then
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew doctor
fi

brew install git docker

git config --global user.email "$email"
git config --global user.name "$username"

# --- js ---
brew install node yarn m-cli thefuck

# vscode
brew install --cask visual-studio-code
git config --global core.editor "code"
# sync settings extenstion installation
code --install-extension shan.code-settings-sync

brew install --cask google-chrome
brew install --cask opera
brew install --cask slack
brew install --cask telegram
brew install --cask notion
brew install --cask figma
brew install --cask alfred
brew install --cask zoom
brew install --cask flux
brew install --cask kap
brew install --cask spotify
brew install --cask vlc
brew install --cask docker
# Not work
# brew install --cask postman
brew install --cask aerial
brew install --cask rectangle
if [[ -z "${CI}" ]]; then
brew cleanup
fi

# nodejs
npm i -g node-gyp n eslint create-react-app http-server eslint-plugin-react eslint-plugin-jsx-a11y eslint-plugin-import eslint-config-airbnb
node --version
npm --version
yarn --version

# ssh
echo "Generate ssh key..."
ssh-keygen -t rsa -b 4096 -C "$email" -N '' -f ~/.ssh/id_rsa -v

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "----------------------------------------";
cat ~/.ssh/id_rsa.pub
echo "----------------------------------------";

echo "Checklist:"
echo "- setup keyboard typing speed"
echo "- clean dock"
echo "- download all settings for VSCode via Sync Settings"
echo "- wallpapers https://apps.apple.com/us/app/unsplash-wallpapers/id1284863847"

echo "Done. Note that some of these changes require a logout/restart to take effect."
