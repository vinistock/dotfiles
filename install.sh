#!/bin/bash

if [ $SPIN ]; then
    # Configure git
    git config --global alias.co checkout
    git config --global alias.sw switch
    git config --global commit.gpgsign true
    git config --global core.editor "code --wait"

    # Link dotfiles
    ln -sf ~/dotfiles/zshrc ~/.zshrc
    ln -sf ~/dotfiles/vimrc ~/.vimrc
    ln -sf ~/dotfiles/gemrc ~/.gemrc
fi
