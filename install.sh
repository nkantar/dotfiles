#!/bin/bash

# NOTE: only really tested on OS X 10.11 El Capitan

# NOTE: destructive (runs rm -rf for existing files before ln -s)

rm -rf ~/.aliases
ln -s ~/dotfiles/aliases ~/.aliases

rm -rf ~/.gitconfig
ln -s ~/dotfiles/gitconfig ~/.gitconfig

rm -rf ~/.tmux.conf
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

rm -rf ~/.zshrc
ln -s ~/dotfiles/zshrc ~/.zshrc

rm -rf ~/.config/nvim/init.vim
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

rm -rf ~/.config/nvim/bundle/Spacegray.vim/colors/spacegray.vim
ln -s ~/dotfiles/nvim/spacegray.vim ~/.config/nvim/bundle/Spacegray.vim/colors/spacegray.vim

rm -rf ~/.config/nvim/bundle/ultisnips/snippets/python.snippets
ln -s ~/dotfiles/nvim/python.snippets ~/.config/nvim/bundle/ultisnips/snippets/python.snippets

rm -rf ~/.iterm2
ln -s ~/dotfiles/iterm2 ~/.iterm2

