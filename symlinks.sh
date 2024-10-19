#!/bin/bash

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/lazyvim/ ~/.config/nvim
ln -s ~/.dotfiles/zellij/ ~/.config/zellij
ln -s ~/.dotfiles/alacritty/ ~/.config/alacritty
ln -s ~/.dotfiles/kitty/ ~/.config/kitty
ln -s ~/.dotfiles/linearmouse/ ~/.config/linearmouse
mkdir ~/Library/Application\ Support/com.mitchellh.ghostty/config
ln -s ~/.dotfiles/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
