#!/bin/bash

dir=$(pwd -P)

rm -rf ~/.config/alacritty
rm -rf ~/.config/albert
rm -rf ~/.config/awesome
rm -rf ~/.config/colours
rm -rf ~/.config/kitty
rm -rf ~/.config/mc
rm -rf ~/.config/nvim
rm -rf ~/.config/systemd
rm -rf ~/.gitconfig
rm -rf ~/.gitignore_global
rm -rf ~/.tmux.conf
rm -rf ~/.vimrc
rm -rf ~/.xbinkeysrc
rm -rf ~/.xinitrc
rm -rf ~/.zshrc
rm -rf ~/.oh-my-zsh/themes/lambda-mod.zsh-theme

ln -f -s $dir/home_configs/.gitignore_global ~/.gitignore_global
ln -f -s $dir/home_configs/.gitconfig ~/.gitconfig
ln -f -s $dir/home_configs/.vimrc ~/.vimrc
ln -f -s $dir/home_configs/.zshrc ~/.zshrc
mkdir -p ~/.oh-my-zsh/themes/
ln -f -s $dir/home_configs/lambda-mod.zsh-theme ~/.oh-my-zsh/themes/lambda-mod.zsh-theme
ln -f -s $dir/home_configs/.tmux.conf ~/.tmux.conf
ln -f -s $dir/home_configs/.xbindkeysrc ~/.xbindkeysrc
ln -f -s $dir/home_configs/.xinitrc ~/.xinitrc

ln -f -s $dir/dot_config/alacritty ~/.config/alacritty
ln -f -s $dir/dot_config/albert ~/.config/albert
ln -f -s $dir/dot_config/awesome ~/.config/awesome
ln -f -s $dir/dot_config/colours ~/.config/colours
ln -f -s $dir/dot_config/kitty ~/.config/kitty
ln -f -s $dir/dot_config/mc ~/.config/mc
ln -f -s $dir/dot_config/nvim ~/.config/nvim
ln -f -s $dir/dot_config/systemd ~/.config/systemd

mkdir -p ~/.local/share/nvim/site/autoload/
ln -f -s $dir/reqs/plug.vim ~/.local/share/nvim/site/autoload/plug.vim
mkdir -p ~/.local/bin/
ln -f -s $dir/dot_local/bin/screenlock ~/.local/bin/screenlock
ln -f -s $dir/dot_local/bin/screenlock_decider ~/.local/bin/screenlock_decider

