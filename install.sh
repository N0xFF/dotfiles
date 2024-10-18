#!/usr/bin/env bash

./apt-get.sh

stow --restow */ \
  2> >(grep -v 'BUG in find_stowed_path? Absolute/relative mismatch' 1>&2) # https://github.com/aspiers/stow/issues/65

# Update aliases
source ~/.bashrc
