#!/usr/bin/env bash

git config --global include.path .git_aliases

sh makesymlinks.sh

cat <<EOT >> ~/.bashrc
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
EOT

source ~/.bashrc
