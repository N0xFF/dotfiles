#!/usr/bin/env bash

# Install packages
if [ -x "$(command -v apt-get)" ]; then
  ./apt-get.sh
elif [ -x "$(command -v pacman)" ]; then
  ./pacman.sh
fi

# Set up dotfiles
stow --restow */ \
  2> >(grep -v 'BUG in find_stowed_path? Absolute/relative mismatch' 1>&2) # https://github.com/aspiers/stow/issues/65

# Auto run starship
if ! grep -Fxq "starship init" ~/.bashrc; then
  echo 'eval "$(starship init bash)"' >> ~/.bashrc
fi

# Update aliases
source ~/.bashrc
