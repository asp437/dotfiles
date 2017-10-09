#!/bin/bash

dir=$(pwd -P)

ln -f -s $dir/.gitignore_global ~/.gitignore_global
ln -f -s $dir/.gitconfig ~/.gitconfig
ln -f -s $dir/.vimrc ~/.vimrc
ln -f -s $dir/init.vim ~/.config/nvim/init.vim
ln -f -s $dir/.zshrc ~/.zshrc
ln -f -s $dir/lambda-mod.zsh-theme ~/.oh-my-zsh/themes/lambda-mod.zsh-theme
ln -f -s $dir/.tmux.conf ~/.tmux.conf

