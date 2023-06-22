#!/bin/bash

############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dotfiles_dir=$(dirname "$0") # dotfiles directory
dotfiles_path=$(realpath "$dotfiles_dir") # dotfiles directory path
backup_path=${dotfiles_path}/backup # backup directory path
files="nano bash_aliases git_aliases nanorc" # list of files/folders to symlink in homedir

##########

echo "dotfiles directory: $dotfiles_dir"
echo "dotfiles path: $dotfiles_path"
echo "backup path: $backup_path"
echo "files/folders: $files"

# create backup_path in homedir
echo -n "Creating $backup_path for backup of any existing dotfiles in ~ ..."
mkdir -p $backup_path
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dotfiles_path directory ..."
cd $dotfiles_path
echo "done"

# move any existing dotfiles in homedir to backup_path directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $backup_path"
  mv ~/.$file $backup_path/
  echo "Creating symlink to $file in home directory."
  ln -s $dotfiles_path/$file ~/.$file
done
