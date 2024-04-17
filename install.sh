#!/bin/bash

# check if root
if [ "$EUID" -ne 0 ]; then 
    echo "Run as root"
    exit
fi

# update packages
sudo apt-get update

# install build tools, ripgrep, tmux
# nvim prereqs: ninja-build gettext cmake unzip curl
sudo apt-get install ninja-build gettext cmake unzip curl ripgrep tmux -y

# install nvm and node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
nvm install 18

# install rust
curl https://sh.rustup.rs -sSf | sh -s -- -y

# install go
goversion="go1.22.0.linux-amd64.tar.gz"
curl --create-dirs --output-dir "tmp" -OL "https://go.dev/dl/${goversion}"
sudo rm -rf /usr/local/go && tar -C /usr/local -xzf "tmp/$goversion"
# go path is set in .zshrc

# install neovim nightly
mkdir -p ~/repos
cd ~/repos
git clone --branch nightly https://github.com/neovim/neovim
cd ~/repos/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

