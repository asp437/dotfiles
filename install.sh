#!/bin/bash

dir=$(pwd -P)

rm -rf ~/.config/awesome
rm -rf ~/.config/colours
rm -rf ~/.config/kitty
rm -rf ~/.config/mc
rm -rf ~/.config/nvim
rm -rf ~/.config/systemd
rm -rf ~/.gitignore_global
rm -rf ~/.gitconfig
rm -rf ~/.vimrc
rm -rf ~/.zshrc
rm -rf ~/.tmux.conf
rm -rf ~/.oh-my-zsh/themes/lambda-mod.zsh-theme

ln -f -s $dir/home_configs/.gitignore_global ~/.gitignore_global
ln -f -s $dir/home_configs/.gitconfig ~/.gitconfig
ln -f -s $dir/home_configs/.vimrc ~/.vimrc
ln -f -s $dir/home_configs/.zshrc ~/.zshrc
mkdir -p ~/.oh-my-zsh/themes/
ln -f -s $dir/home_configs/lambda-mod.zsh-theme ~/.oh-my-zsh/themes/lambda-mod.zsh-theme
ln -f -s $dir/home_configs/.tmux.conf ~/.tmux.conf
ln -f -s $dir/dot_config/awesome ~/.config/awesome
ln -f -s $dir/dot_config/colours ~/.config/colours
ln -f -s $dir/dot_config/kitty ~/.config/kitty
ln -f -s $dir/dot_config/mc ~/.config/mc
ln -f -s $dir/dot_config/nvim ~/.config/nvim
ln -f -s $dir/dot_config/systemd ~/.config/systemd
mkdir -p ~/.local/share/nvim/site/autoload/
ln -f -s $dir/reqs/plug.vim ~/.local/share/nvim/site/autoload/plug.vim

