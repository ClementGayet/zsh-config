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