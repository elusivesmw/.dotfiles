#!/bin/bash

# create missing dirs
ds=(
    ~/.config/nvim
    ~/.config/nvim/lua
    ~/.config/nvim/after
    ~/.config/nvim/after/plugin
)
for d in ${ds[@]}; do
    mkdir -p $d
done

# create symlinks
links=(
    .config/nvim/init.lua
    .config/nvim/lua/elusive/init.lua
    .config/nvim/lua/elusive/global.lua
    .config/nvim/lua/elusive/packer.lua
    .config/nvim/lua/elusive/parens.lua
    .config/nvim/lua/elusive/remap.lua
    .config/nvim/lua/elusive/set.lua
    .config/nvim/after/plugin/fugitive.lua
    .config/nvim/after/plugin/lsp.lua
    .config/nvim/after/plugin/telescope.lua
    .config/nvim/after/plugin/treesitter.lua
    .gitconfig
    .tmux.conf
    .zshrc
)
for link in ${links[@]}; do
    ln -sf ~/.dotfiles/$link ~/$link
done

