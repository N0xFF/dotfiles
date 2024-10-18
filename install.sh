#!/usr/bin/env bash

./apt-get.sh

stow --restow */ \
  2> >(grep -v 'BUG in find_stowed_path? Absolute/relative mismatch' 1>&2) # https://github.com/aspiers/stow/issues/65

if [ ! -x "$(command -v starship)" ]; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
  echo 'eval "$(starship init bash)"' >> ~/.bashrc
fi

# Update aliases
source ~/.bashrc
