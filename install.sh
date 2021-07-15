#!/bin/sh

# this script for Ubuntu 20.04

sudo apt -y install neovim
sudo apt -y install language-pack-ja
cp .bashrc ~
source ~/.bashrc
mkdir ~/.config
mkdir ~/.config/nvim
cp vimrc/* ~/.config/nvim/

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein




