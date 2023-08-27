#!/bin/bash

# create missing dirs
ds=(
    ~/.config/nvim
    ~/.config/nvim/lua
)
for d in ${ds[@]}; do
    mkdir -p $d
done

# create symlinks
links=(
    .config/nvim/init.vim
    .config/nvim/lua/elusive.lua
    .gitconfig
    .tmux.conf
    .zshrc
)
for link in ${links[@]}; do
    ln -sf ~/.dotfiles/$link ~/$link
done

