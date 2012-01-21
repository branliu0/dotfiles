#!/usr/bin/env bash

cd ~
ln -s ~/dotfiles/.vim* .
ln -s ~/dotfiles/.bash* .
cd ~/dotfiles
git clone http://github.com/gmarik/vundle.git .vim/bundle/vundle
vim +BundleInstall +qall
