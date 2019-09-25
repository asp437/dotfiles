#!/bin/bash

dir=$(pwd -P)

ln -f -s $dir/.gitignore_global ~/.gitignore_global
ln -f -s $dir/.gitconfig ~/.gitconfig
ln -f -s $dir/.vimrc ~/.vimrc
ln -f -s $dir/.zshrc ~/.zshrc
mkdir -p ~/.oh-my-zsh/themes/
ln -f -s $dir/lambda-mod.zsh-theme ~/.oh-my-zsh/themes/lambda-mod.zsh-theme
ln -f -s $dir/.tmux.conf ~/.tmux.conf
ln -f -s $dir/dot_config/awesome ~/.config/awesome
ln -f -s $dir/dot_config/colours ~/.config/colours
ln -f -s $dir/dot_config/kitty ~/.config/kitty
ln -f -s $dir/dot_config/mc ~/.config/mc
ln -f -s $dir/dot_config/nvim ~/.config/nvim
ln -f -s $dir/dot_config/systemd ~/.config/systemd

