#!/bin/bash
source ./colors.sh

# check if root
if [ "$EUID" -eq 0 ]; then 
    echo "Don't run as root. Script will use sudo when needed"
    exit
fi

# update packages
info "Updating packages..."
sudo apt-get update

# install build tools, ripgrep, tmux
# nvim prereqs: ninja-build gettext cmake unzip curl
info "Installing build tools, etc..."
sudo apt install ninja-build gettext cmake unzip curl ripgrep tmux fzf bat -y

# install nvm and node
info "Installing Node..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
nvm install 20

# install rust
info "Installing Rust..."
curl https://sh.rustup.rs -sSf | sh -s -- -y

# install go
info "Installing Go..."
goversion="go1.24.5.linux-amd64.tar.gz"
sudo curl --create-dirs --output-dir "tmp" -OL "https://go.dev/dl/${goversion}"
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "tmp/$goversion"
# go path is set in .zshrc

info "Installing Neovim..."
# install neovim nightly
mkdir -p ~/repos
cd ~/repos
rm -rf neovim
git clone --branch nightly https://github.com/neovim/neovim
cd ~/repos/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

