#!/bin/bash

if [ $SPIN ]; then
    # Install packages
    sudo apt install -y autoconf coreutils parallel zip bear

    gpgconf --launch dirmngr
    gpg --keyserver keys.openpgp.org --recv 6BD0EDDB0C455BCE681709061A3EC85374C0969A

    # Add git aliases
    git config --global alias.co checkout 
    git config --global alias.sw switch
    git config --global commit.gpgsign true

    # Link dotfiles
    ln -sf ~/dotfiles/zshrc ~/.zshrc
    ln -sf ~/dotfiles/vimrc ~/.vimrc
    ln -sf ~/dotfiles/gemrc ~/.gemrc
    mkdir -p ~/.vim/colors
    ln -sf ~/dotfiles/lapis.vim ~/.vim/colors/lapis.vim
fi
