#!/bin/bash

# create .config dir
mkdir -p ~/.config

# backup existing non-linked nvim dir
if [ -d ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then
    echo "backup ~/.config/nvim"
    mv ~/.config/nvim ~/.config/nvim_old
fi

# create nvim dir symlink
ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim

# create symlinks
links=(
    .gitconfig
    .tmux.conf
    .zshrc
)
for link in ${links[@]}; do
    ln -sf ~/.dotfiles/$link ~/$link
done

