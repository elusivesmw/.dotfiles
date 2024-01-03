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
            echo "backing up ~/$dir"
            mv ~/$dir ~/${dir}_old
        else
            echo "$dir link found, skipping"
            return
        fi
    fi

    # create dir symlink
    echo "$dir, linking"
    ln -sf ~/.dotfiles/$dir ~/$dir
}

# create .config dir
mkdir -p ~/.config

# link nvim dir
linkdir .config/nvim

# link files
files=(
    .gitconfig
    .tmux.conf
    .zshrc
)
for file in ${files[@]}; do
    linkfile $file
done

