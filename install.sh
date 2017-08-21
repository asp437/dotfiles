#!/bin/bash

dir=$(pwd -P)

ln -f -s $dir/.gitignore_global ~/.gitignore_global
ln -f -s $dir/.gitconfig ~/.gitconfig
ln -f -s $dir/.vimrc ~/.vimrc
ln -f -s $dir/.zshrc ~/.zshrc
ln -f -s $dir/.tmux.conf ~/.tmux.conf

