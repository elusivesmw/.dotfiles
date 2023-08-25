#!/bin/bash

# create missing dirs
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/lua

# create symlinks
ln -sf ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/.config/nvim/lua/elusive.lua ~/.config/nvim/lua/elusive.lua
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
# do this better

