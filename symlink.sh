#!/bin/bash

# create symlinks
links=(
    .config
    .gitconfig
    .tmux.conf
    .zshrc
)
for link in ${links[@]}; do
    ln -sf ~/.dotfiles/$link ~/$link
done

