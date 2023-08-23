#!/bin/bash

# update packages
sudo apt-get update

# install tmux
sudo apt-get install tmux -y

# install prereqs
sudo apt-get install ninja-build gettext cmake unzip curl

# install nvm and node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
nvm install 18

# install neovim nightly
cd ~
git clone --branch nightly https://github.com/neovim/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

# install plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# create missing dirs
mkdir ~/.config/nvim
mkdir ~/.config/nvim/lua

# create symlinks
ln -sf ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/.config/nvim/lua/elusive.lua ~/.config/nvim/lua/elusive.lua
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
# do this better
