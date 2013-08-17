#!/usr/bin/env bash

# TODO:
# - If there's a flag set, use SSH clone (low priority)
# - Check that git dependency is set (low priority)
# - Ask for confirmation for each symlink
# - Ask for confirmation of installation location
# - Update existing repository, check whether the current folder name is dotfiles

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function check_if_update() {
  parent_dir=$(basename $(pwd))
  if [[ $parent_dir = "dotfiles" ]]; then
    echo "Looks like you're updating. This script currently only handles installation."
    exit 1
  fi
}

function check_dependencies() {
  type git &> /dev/null || echo -e "\[\033[1;31m\]git is a required dependency.\[\033[0m\]"
}

# Check to see if we're updating or installing
check_if_update

# Check to make sure all dependencies are installed
check_dependencies

echo This bash script will download and install the dotfiles from
echo http://github.com/thenovices/dotfiles.
echo If you want to update, please run this script from the dotfiles directory
echo
echo The dotfiles will be installed in "$(pwd)"/dotfiles
read -p "Is that okay? [Yn] " confirm

# Transform to lower case
confirm=$(echo $confirm | tr [:upper:] [:lower:])

if [[ -n $confirm && $confirm != "y" && $confirm != "yes" ]]; then
  echo Please re-run this script in the desired installation directory.
  exit 1
fi

echo
echo Downloading and installing...
git clone --quiet https://github.com/thenovices/dotfiles.git dotfiles
cd dotfiles

# Build up a list of all the dotfiles (ignoring .git)
dotfiles=()
for f in $(find . -maxdepth 1 -name ".[^.]*" -exec basename {} \; | \
    grep -vE ".git(ignore)?$"); do
  dotfiles+=("$f")
done

echo
echo Symlinking the following dotfiles: $dotfiles
echo Existing files will be backed up with the .old extension

for f in "${dotfiles[@]}"; do
  # Back it up if it already exists
  if [[ -f ~/$f ]]; then
    cp -f ~/$f ~/$f.old
  elif [[ -d ~/$f ]]; then
    cp -rf ~/$f ~/$f.old
  fi
  # And symlink it to the relative directory!
  abs_path=$("$DIR/bin/readlink-f" "$f")
  rel_path="${abs_path#$HOME/}"
  ln -sf $rel_path ~/$f
done

echo
echo Installing vim plugins "(could take a while)"
git clone --quiet https://github.com/gmarik/vundle.git .vim/bundle/vundle
vim +BundleInstall +qall < /dev/tty # necessary to avoid vim: Input not from terminal warning

source ~/.bashrc

echo
echo -e "\[\033[1;32m\]Everything succesfully installed.\[\033[0m\]"
