#!/usr/bin/bash

set -e

sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort $HOME/pkglist.txt)) --noconfirm

$(command -v git) --git-dir=$HOME/dotfiles/ --work-tree=$HOME submodule update --init --recursive

cd $HOME/.config/dwm/
sudo make clean install

cd $HOME/.config/dmenu/
sudo make clean install

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

echo "Dotfiles installation finished successfully."
