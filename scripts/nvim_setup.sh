#!/bin/bash

bob use stable

mkdir -p ~/.config/nvim;
ln -s ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/dotfiles/nvim/lua ~/.config/nvim/lua

