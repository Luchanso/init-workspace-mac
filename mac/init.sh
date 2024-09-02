#!/usr/bin/env bash
set -e

if [[ -z "${CI}" ]]; then
sudo -v
else
fi

echo "Setting up Brew and applications"

if [[ -z "${CI}" ]]; then
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew doctor
fi

brew install git

# --- js ---
brew install node yarn m-cli thefuck gnupg gnupg2 oven-sh/bun/bun

# vscode
brew install --cask visual-studio-code
git config --global core.editor "code"

brew install --cask google-chrome
brew install --cask telegram
brew install --cask notion
brew install --cask figma
brew install --cask raycast
brew install --cask zoom
brew install --cask flux
brew install --cask kap
brew install --cask vlc
brew install --cask docker
brew install --cask postman
brew install dive

if [[ -z "${CI}" ]]; then
brew cleanup
fi

# nodejs
node --version
npm --version
yarn --version
bun --version


if [[ -z "${CI}" ]]; then
read -p "Enter your name: " username
read -p "Enter your email: " email
else
username="test"
email="test@test.com"
fi

git config --global user.email "$email"
git config --global user.name "$username"

# ssh
echo "Generate ssh key..."
ssh-keygen -t ed25519 -C "$email" -N '' -f ~/.ssh/id_ed25519 -v

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "----------------------------------------";
cat ~/.ssh/id_ed25519.pub
echo "----------------------------------------";

echo "Checklist:"
echo "- setup keyboard typing speed"
echo "- clean dock"
echo "- sync all settings for VSCode"
echo "- wallpapers https://apps.apple.com/us/app/unsplash-wallpapers/id1284863847"

echo "Done. Note that some of these changes require a logout/restart to take effect."
