#!/bin/bash

function linkfile {
    file="$1"
    if [ ! -e ~/$file ] && [ ! -L ~/$file ] ; then
        echo "$file not found, linking..."
        ln -sf ~/.dotfiles/$file ~/$file
    else
        echo "$file found, skipping..."
    fi
}

function linkdir {
    dir="$1"
    # handle existing directories
    if [ -d ~/$dir ]; then
        if [ ! -L ~/$dir ]; then
            echo "${dir} found, backing up..."
            mv_merge ~/$dir ~/${dir}_old
        else
            echo "$dir link found, skipping..."
            return
        fi
    fi

    # create dir symlink
    echo "linking ${dir}..."
    ln -sf ~/.dotfiles/$dir ~/$dir
}

function mv_merge {
    source="$1"
    target="$2"
    cp -rl $source/. $target
    rm -r $source
}

# create .config dir
mkdir -p ~/.config

# link nvim dir
linkdir .config/nvim

# link alacritty
linkdir .config/alacritty

# link wezterm 
linkdir .config/wezterm

# link files
files=(
    .gitconfig
    .tmux.conf
    .zshrc
    .stylua.toml
)
for file in ${files[@]}; do
    linkfile $file
done

