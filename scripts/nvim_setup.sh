#!/bin/bash


sudo update-alternatives --set vi /usr/bin/nvim;
sudo update-alternatives --set vim /usr/bin/nvim;
sudo update-alternatives --set view /usr/bin/nvim;

mkdir -p ~/.config/nvim;
ln -s ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/dotfiles/nvim/lua ~/.config/nvim/lua

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -c "PlugInstall|q|q"