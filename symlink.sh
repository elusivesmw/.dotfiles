#!/bin/bash

# backup nvim dir if exists
if [ -d "~/.config/nvim" ]; then
    mv ~/.config/nvim ~/.config/nvim_old
fi

# nvim dir symlink
ln -sf ~/.dotfiles/.config/nvim ~/.config

# create symlinks
links=(
    .gitconfig
    .tmux.conf
    .zshrc
)
for link in ${links[@]}; do
    ln -sf ~/.dotfiles/$link ~/$link
done

