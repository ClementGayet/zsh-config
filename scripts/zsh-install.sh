#!/bin/sh

# This script is here to install zsh & dependencies

# Checking if current machine has required dependencies, if not, install them
if ! [ -x "$(command -v zsh)" ]; then
  echo 'Error: zsh is not installed.' >&2
  echo 'Installing zsh...'
  sudo apt-get install zsh
fi

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  echo 'Installing git...'
  sudo apt-get install git
fi

if ! [ -x "$(command -v curl)" ]; then
  echo 'Error: curl is not installed.' >&2
  echo 'Installing curl...'
  sudo apt-get install curl
fi

# Installing oh-my-zsh
echo 'Installing oh-my-zsh...'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Installing plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-"$HOME"/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copying files to the right place using symlinks
echo 'Copying files to the right place...'

path=$(realpath ../) # is the path to the directory where the files should be copied to.

mv "$HOME/.zshrc" "$HOME/.zshrc.bak" # backup the old .zshrc file
ln -s "$path/.zshrc" "$HOME/.zshrc"
