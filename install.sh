#!/bin/bash

# update packages
sudo apt-get update

# install build tools, ripgrep, tmux
# nvim prereqs: ninja-build gettext cmake unzip curl
sudo apt-get install ninja-build gettext cmake unzip curl ripgrep tmux -y

# install nvm and node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
nvm install 18

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -- -y

# install stylua
cargo install stylua

# install neovim nightly
mkdir -p ~/repos
cd ~/repos
git clone --branch nightly https://github.com/neovim/neovim
cd ~/repos/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

